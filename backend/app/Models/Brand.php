<?php

namespace App\Models;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;


class Brand extends Model
{
    protected $table = 'brands';

    protected $fillable = [
        "id",
        "title",
        "slug",
        "image_id",
    "meta_title",
    "meta_description",
    "meta_keywords",

    ];


    public function image()
    {
        return $this-> belongsTo(Filemanager::class, 'image_id');
    }

    public function products()
{
    return $this->hasMany(Product::class);
}

}