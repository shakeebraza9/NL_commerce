<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::where('is_enable', 1)
            ->orderBy('sort', 'asc')
            ->get();

        return response()->json([
            'status' => true,
            'data' => $categories
        ]);
    }
}
