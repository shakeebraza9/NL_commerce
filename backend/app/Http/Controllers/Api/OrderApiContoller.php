<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProductCollection;
use Illuminate\Support\Facades\DB;
use App\Models\Order;

class OrderApiContoller extends Controller
{

public function track($trackingId)
    {
        $order = Order::with(['items.product', 'status'])
                    ->where('tracking_id', $trackingId)
                    ->first();

        if (!$order) {
            return response()->json([
                'status' => false,
                'message' => 'Order not found'
            ], 404);
        }

        return response()->json([
            'status' => true,
            'order' => $order
        ]);
    }

}
