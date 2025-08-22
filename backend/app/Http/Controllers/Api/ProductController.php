<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Collection;
use App\Models\ProductCollection;
use Illuminate\Support\Facades\DB;
use App\Models\Brand;
use App\Models\newsletter;
use App\Models\Attribute;
use App\Models\Value;
use App\Models\Page;
use App\Models\Variation;
use App\Models\VariationAttribute;
use App\Models\Slider;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Mail;
use Symfony\Component\Mime\Part\HtmlPart;
use Illuminate\Support\Facades\App;

class ProductController extends Controller
{
public function popular()
    {
        $products = Product::where('is_popular', 1)
            ->where('is_enable', 1)
            ->latest()
            ->take(12)
            ->get();

        return response()->json([
            'status' => true,
            'data'   => $products
        ]);
    }


    public function search(Request $request)
    {
        $search = $request->query('title'); // GET parameter se title lena

        if (!$search) {
            return response()->json([
                'status' => false,
                'message' => 'title query parameter is required'
            ], 400);
        }

        $products = Product::where('title', 'LIKE', "%{$search}%")
            ->where('is_enable', 1)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json([
            'status' => true,
            'data'   => $products
        ]);
    }



   public function shop(Request $request)
    {
        $data = Product::query();

        // 1️⃣ Search
        if ($request->has('search') && $request->search != '') {
            $searchTerm = $request->search;
            $data->where(function ($query) use ($searchTerm) {
                $query->where('title', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('slug', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('sku', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('details', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('description', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('meta_title', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('meta_description', 'LIKE', "%{$searchTerm}%")
                    ->orWhere('meta_keywords', 'LIKE', "%{$searchTerm}%");
            });
        }

        // 2️⃣ Sorting
        if ($request->has('sort') && $request->sort != '') {
            switch ($request->sort) {
                case 'newest':
                    $data->orderBy('id', 'desc');
                    break;
                case 'ascending':
                    $data->orderBy('title', 'asc');
                    break;
                case 'descending':
                    $data->orderBy('title', 'desc');
                    break;
                case 'price-low':
                    $data->orderBy('price', 'asc');
                    break;
                case 'price-high':
                    $data->orderBy('price', 'desc');
                    break;
                default:
                    $data->orderBy('id', 'desc');
                    break;
            }
        } else {
            $data->orderBy('id', 'desc');
        }

        // 3️⃣ Category filter
        if ($request->has('category') && $request->category != '') {
            $category = Category::where('slug', $request->category)->first();
            if ($category) {
                $data->where('category_id', $category->id);
            }
        }

        // 4️⃣ Collection filter
        if ($request->has('collection') && $request->collection != '') {
            $collection = Collection::where('slug', $request->collection)->first();
            if ($collection) {
                $productCollectionIds = ProductCollection::where('collection_id', $collection->id)
                    ->pluck('product_id')
                    ->toArray();
                $data->whereIn('id', $productCollectionIds);
            }
        }

        // 5️⃣ Pagination
        $perPage = $request->has('per_page') ? intval($request->per_page) : 10;
        $products = $data->paginate($perPage);

        // 6️⃣ Discount
        $discountSetting = DB::table('settings')->where('field', 'discount_percent')->first();
        $discountPercent = $discountSetting ? floatval($discountSetting->value) : 0;

        $products->getCollection()->transform(function ($product) use ($discountPercent) {
            $discountAmount = ($product->price * $discountPercent) / 100;
            $product->price = round($product->price - $discountAmount, 2);
            return $product;
        });

        // 7️⃣ JSON Response
        return response()->json([
            'status' => true,
            'data' => $products
        ]);
    }

    public function productApi($id)
{
    // Fetch product with variations
    $product = Product::with(['variations.attributes.values', 'variations.attributes.attribute'])
        ->where('slug', $id)
        ->firstOrFail();

    // Get related products randomly
    $related_products = Product::orderByRaw('RAND()')->limit(4)->get();

    // ✅ Get discount percent value from settings
    $discountSetting = DB::table('settings')->where('field', 'discount_percent')->first();
    $discount = 0;

    if ($discountSetting && is_numeric($discountSetting->value)) {
        $discount = (float) $discountSetting->value;
    }

    // 🟢 Apply discount on main product price if applicable
    $finalProductPrice = $product->price;
    if ($discount > 0 && $finalProductPrice > 0) {
        $discountAmount = ($finalProductPrice * $discount) / 100;
        $finalProductPrice = round($finalProductPrice - $discountAmount, 2);
    }

    $attributes = [];
    $values = [];
    $variations = [];

    foreach ($product->variations as $variation) {
        foreach ($variation->attributes as $attribute) {

            // 🟢 Apply discount to variation price
            $variationPrice = $variation->price;
            if ($discount > 0 && $variationPrice > 0) {
                $variationPrice = round($variationPrice - ($variationPrice * $discount) / 100, 2);
            }

            $variations[] = [
                'variation_id'     => $variation->id,
                'sku'              => $variation->sku,
                'quantity'         => $variation->quantity,
                'price'            => $variationPrice,
                'image'            => $variation->image,
                'attribute_id'     => $attribute->attribute->id,
                'attribute_title'  => $attribute->attribute->title,
                'value_id'         => $attribute->values->id,
                'value_title'      => $attribute->values->title,
            ];

            $attributes[$attribute->attribute->id] = $attribute->attribute->toArray();
            $values[$attribute->values->id] = $attribute->values->toArray();
        }
    }

    // 🟢 JSON Response
    return response()->json([
        'status'   => true,
        'message'  => 'Product details fetched successfully',
        'data'     => [
            'product'   => [
                'id'    => $product->id,
                'title' => $product->title,
                'brand' => $product->brand ? $product->brand->title : null,
                'description' => $product->description,
                'slug'  => $product->slug,
                'price' => $finalProductPrice,
                'originalPrice' => $product->selling_price,
                'image' => $product->image,
                'hover_image' => $product->hover_image,
                'gallery' => $product->images,
            ],
            'attributes'        => array_values($attributes),
            'values'            => array_values($values),
            'variations'        => $variations,
            'related_products'  => $related_products,
            'discount_percent'  => $discount,
        ]
    ], 200);
}


}
