<?php
namespace App\Events;

use App\Models\SupportMessage;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class SupportMessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $support;

    public function __construct(SupportMessage $support)
    {
        $this->support = $support;
    }

    // Broadcast on a global "support" channel
    public function broadcastOn()
    {
        return new Channel('support');
    }

    // Event name for JS listener
    public function broadcastAs()
    {
        return 'support.sent';
    }
}
