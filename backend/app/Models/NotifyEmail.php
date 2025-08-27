<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NotifyEmail extends Model
{
    use HasFactory;

    protected $fillable = ['product_id', 'variation_id', 'email'];
}
