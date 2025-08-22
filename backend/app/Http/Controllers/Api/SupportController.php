<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\SupportMessage;
use Illuminate\Http\Request;
class SupportController  extends Controller
{
public function store(Request $request)
{
    $request->validate([
        'message' => 'required|string|max:1000',
    ]);

    $support = SupportMessage::create([
        'message' => $request->message,
        'ip_address' => $request->ip_address,
    ]);

    // Broadcast event
    event(new \App\Events\SupportMessageSent($support));

    return response()->json([
        'status' => true,
        'message' => 'Message sent successfully',
        'data' => $support
    ]);
}




public function find(Request $request, $ip)
{
    $messages = SupportMessage::where('ip_address', $ip)->get();

    return response()->json([
        'status' => true,
        'message' => 'Messages fetched successfully',
        'data' => $messages
    ]);
}



}
