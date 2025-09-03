<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductReview extends Model
{
    protected $table = 'product_reviews';

    protected $fillable = [
        'product_id',
        'name',
        'review',
        'star',
        'status',
        'is_home',
        'created_at',
        'updated_at',
    ];
}
