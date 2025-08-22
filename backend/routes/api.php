<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\SliderController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\sSettingSController;
use App\Http\Controllers\Api\OrderApiContoller;
use App\Http\Controllers\Api\SupportController;
use App\Events\TestEvent;

Route::get('/test-broadcast', function () {
    event(new TestEvent("Hello from backend!"));
    return "Event fired!";
});

Route::prefix('v1')->group(function () {
    Route::get('/menu/{id}', [MenuController::class, 'getMenuWithItems']);
    Route::get('/sliders', [SliderController::class, 'index']);
    Route::get('/categories', [CategoryController::class, 'index']);
    Route::get('/products/popular', [ProductController::class, 'popular']);
    Route::get('products/search', [ProductController::class, 'search']);
    Route::get('/shop', [ProductController::class, 'shop']);
    Route::get('/settings', [sSettingSController::class, 'index']);
    Route::post('/subscribe', [sSettingSController::class, 'store']);
    Route::get('/order-tracking/{trackingId}', [OrderApiContoller::class, 'track']);
    Route::post('/support-message', [SupportController::class, 'store']);
    Route::get('/support-message/{ip}/find', [SupportController::class, 'find']);

});
