<?php

namespace App\Http\Controllers\Api;

use App\Models\Setting;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class sSettingSController extends Controller
{
    // sab settings fetch karne ke liye
    public function index()
    {
        $settings = Setting::orderBy('id', 'asc')->get();

        return response()->json([
            'status' => true,
            'data' => $settings
        ]);
    }


        public function store(Request $request)
    {
        $request->validate([
            'email' => 'required|email|unique:subscribers,email',
        ]);

        DB::table('subscribers')->insert([
            'email' => $request->email,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $adminEmail = "admin@example.com";

        Mail::raw("New subscription from: " . $request->email, function ($message) use ($adminEmail) {
            $message->to($adminEmail)
                    ->subject('New Channel Subscription');
        });

        return response()->json([
            'status' => true,
            'message' => 'Subscribed successfully, admin has been notified!'
        ]);
    }
}
