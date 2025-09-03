<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WebsiteActivity extends Model
{
    protected $table = 'website_activity';

    protected $fillable = [
        'page_name',
        'ip_address',
        'country',
        'city',
        'visited_at',
        'created_at',
    ];

    public $timestamps = false; // kyunki already created_at aur visited_at fields hain
}
