<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupportMessage extends Model
{
    use HasFactory;

    protected $table = 'support_messages'; // table name

    protected $fillable = [
        'message',
        'ip_address',
        'reply',
        'status',
    ];

    /**
     * Relation: Ek message ek user ka hoga
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
