<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Page;

class PageController extends Controller
{
    // Get all pages
    public function index()
    {
        $pages = Page::all();
        return response()->json($pages);
    }

    // Get single page by slug
    public function show($slug)
    {
        $page = Page::where('slug', $slug)->first();

        if (!$page) {
            return response()->json(['message' => 'Page not found'], 404);
        }

        return response()->json($page);
    }
}
