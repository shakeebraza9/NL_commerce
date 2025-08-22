<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductBrand;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Carbon\Carbon;
use Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\URL;
use Illuminate\Validation\Rule;
use Laravel\Ui\Presets\React;

class BrandController extends Controller
{

    public function index(Request $request)
    {

        if($request->ajax()){

            $query = Brand::Query();

            //Search
            $search = $request->get('search')['value'];
            if($search != ""){
               $query = $query->where(function ($s) use($search) {
                   $s->where('product_brand.title','like','%'.$search.'%')
                   ->orwhere('product_brand.slug','like','%'.$search.'%');
               });
            }


            $count = $query->get();

            $records = $query->skip($request->start)
            ->take($request->length)
            ->get();

            $data = [];
            foreach ($records as $key => $value) {

                $is_enable = $value->is_enable ? 'checked' : '';
                $is_featured = $value->is_featured ? 'checked' : '';

                if($value->parent_id != 0){
                  $Brand = Brand::where('id',$value->parent_id)->first();
                  if($Brand){
                    $Brand = $Brand->title;
                  }else{
                    $Brand = "None";
                  }
                }else{
                    $Brand = "None";
                }

                $action = '<div class="btn-group">';

                $action .= '<a class="btn btn-info" href="'.URL::to('admin/brand/edit/'.Crypt::encryptString($value->id)).'">Edit</a>';
                $action .= '<a class="btn btn-danger" href="'.URL::to('admin/brand/delete/'.Crypt::encryptString($value->id)).'">Delete</a>';

                $action .= '</div>';
                $img =  $value->image_id ? asset($value->image_id) : '';

                array_push($data,[
                    $value->id,
                   "<img style='width:50px;' src='".$img."' />",
                    $value->title,
                    $value->slug,

                    '<div class="switchery-demo m-b-30">
                    <input data-id="'.Crypt::encryptString($value->id).'" '.$is_enable.' type="checkbox"  class="is_enable js-switch" data-color="#009efb"/></div>',

                    $action,
                 ]
                );
            }

            return response()->json([
                "draw" => $request->draw,
                "recordsTotal" => count($count),
                "recordsFiltered" => count($count),
                'data'=> $data,
            ]);
        }

        return view('admin.brand.index');
    }




    public function create()
    {

        return view('admin.brand.create');
    }



    public function store(Request $request)
    {


        $validator = Validator::make($request->all(),[
            "title" => 'required|max:255',
            'slug' => [
              'required',
              'max:255',
              Rule::unique('brands'),
            ],
            'meta_title' => 'max:255',
            'meta_description' => 'max:255',
            'meta_keywords' => 'max:255',
        ]);

        if($validator->fails()){
            return back()
                ->withErrors($validator)
                ->withInput();
        }


        $ProductBrand = Brand::create([
            'title' => $request->title,
            "slug" => $request->slug,
            "image_id" => $request->image_id,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keywords' => $request->meta_keywords,

        ]);

        return redirect('/admin/brand/index')->with('success','Record Created Success');

    }



     /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function edit(Request $request,$id)
    {

        $id = Crypt::decryptString($id);
        $model = Brand::find($id);
        if($model == false){
            return back()->with('error','Record Not Found');
         }


        return view('admin.brand.edit',compact('model'));
    }


    public function update(Request $request,$id)
    {



        $id = Crypt::decryptString($id);
        $validator = Validator::make($request->all(), [
            "title" => 'required|max:255',
            'slug' => [
                'required',
                'max:255',
                Rule::unique('brands')->ignore($id),
            ],

            "image_id" => 'required',
            'meta_title' => 'max:255',
            'meta_description' => 'max:255',
            'meta_keywords' => 'max:255',
        ]);

        if ($validator->fails()) {
            return back()
                ->withErrors($validator)
                ->withInput();
        }

        $Brand = Brand::find($id);
        if($Brand == false){
           return back()->with('error','Record Not Found');
        }


        $Brand->title = $request->title;
        $Brand->slug = $request->slug;

        $Brand->image_id = $request->image_id;
        $Brand->meta_title = $request->meta_title;
        $Brand->meta_description = $request->meta_description;
        $Brand->meta_keywords = $request->meta_keywords;
        $Brand->save();


        return back()->with('success','Record Updated');

    }


    public function delete($id)
    {
        $data = Brand::find(Crypt::decryptString($id));
        if($data == false){
            return back()->with('warning','Record Not Found');
        }else{


            $product = Product::where('Brand_id',$data->id)->get();
            if(count($product) > 0){
                return back()->with('warning','This Brand Used In Products');
            }


            $data->delete();
            return redirect('/admin/brand/index')->with('success','Record Deleted Success');
        }

    }














}