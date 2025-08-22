<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Menu;

class MenuController extends Controller
{
public function getMenuWithItems($id)
{
    $menu = Menu::with(['items.children.children.children'])->find($id);

    if (!$menu) {
        return response()->json([
            'status' => false,
            'message' => 'Menu not found'
        ], 404);
    }

    // Transform function for recursive children
    $transformItems = function ($items) use (&$transformItems) {
        return $items->map(function ($item) use ($transformItems) {
            return [
                'id'   => $item->id,
                'name' => $item->title,
                'slug' => $item->link,
                'children' => $item->children->isNotEmpty()
                    ? $transformItems($item->children)
                    : []
            ];
        });
    };

    $data = [
        'id'   => $menu->id,
        'name' => $menu->name,
        'slug' => $menu->slug,
        'items' => $transformItems($menu->items)
    ];

    return response()->json([
        'status' => true,
        'data'   => $data
    ]);
}

}
