<?php

namespace App\Events;

use App\Models\SupportMessage;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Queue\SerializesModels;

class SupportReplied implements ShouldBroadcast
{
    use InteractsWithSockets, SerializesModels;

    public $message;

    public function __construct(SupportMessage $message)
    {
        $this->message = $message;
    }

 public function broadcastOn()
{
    $safeIp = str_replace('.', '_', $this->message->ip_address);
    return new Channel("support.{$safeIp}");
}


    public function broadcastAs()
    {
        return "support.replied";
    }

    // Ye payload explicitly define karo
    public function broadcastWith()
    {
        return [
            "id" => $this->message->id,
            "ip_address" => $this->message->ip_address,
            "message" => $this->message->message,
            "reply" => $this->message->reply,
            "status" => $this->message->status,
        ];
    }
}
