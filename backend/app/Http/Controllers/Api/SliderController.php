<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Slider;

class SliderController extends Controller
{
    public function index()
    {
        $sliders = Slider::where('is_enable', 1)
            ->orderBy('sort', 'asc')
            ->get();

        return response()->json([
            'status' => true,
            'data' => $sliders
        ]);
    }
}
