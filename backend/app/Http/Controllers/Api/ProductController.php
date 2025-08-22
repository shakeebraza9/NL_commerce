<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Collection;
use App\Models\ProductCollection;
use Illuminate\Support\Facades\DB;
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

}
