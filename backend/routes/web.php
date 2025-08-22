<?php

use Illuminate\Support\Facades\Route;
use App\Models\User;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/





//Blogs
Route::get('/', [App\Http\Controllers\HomeController::class, 'home'])->name('home');
Route::get('/category/{id}', [App\Http\Controllers\HomeController::class, 'category']);

Route::get('/products/{id}', [App\Http\Controllers\HomeController::class, 'product']);

Route::get('/shop', [App\Http\Controllers\HomeController::class, 'shop'])->name('shop.index');;
Route::get('/shopdata', [App\Http\Controllers\HomeController::class, 'shopData'])->name('shop.data');;


// Route::post('/cart/add_to_cart', [App\Http\Controllers\HomeController::class, 'add_to_cart']);

Route::get('/combination_maker', [App\Http\Controllers\HomeController::class, 'combination_maker']);
Route::get('/blogs/categories/{id}', [App\Http\Controllers\HomeController::class, 'blog_categories']);
Route::get('/pages/{slug}', [App\Http\Controllers\HomeController::class, 'pageContent']);

//Carts
Route::get('/cart', [App\Http\Controllers\CartController::class, 'cart']);
Route::get('/getCart', [App\Http\Controllers\CartController::class, 'getCart']);

Route::get('/cart/add_to_cart', [App\Http\Controllers\CartController::class, 'add_to_cart']);
Route::get('/cart/get_cart_details', [App\Http\Controllers\CartController::class, 'get_cart_details']);
Route::get('/cart/cart_clear', [App\Http\Controllers\CartController::class, 'cart_clear']);
Route::get('/cart/remove/{id}', [App\Http\Controllers\CartController::class, 'cart_remove']);



//Checkout
Route::get('/order-tracking', [App\Http\Controllers\CheckoutController::class, 'order_tracking']);

Route::get('/checkout', [App\Http\Controllers\CheckoutController::class, 'index']);
Route::get('/order-confirmaton/{id}', [App\Http\Controllers\CheckoutController::class, 'order_confirmaton']);
Route::post('/checkout/submit', [App\Http\Controllers\CheckoutController::class, 'checkout_submit']);
Route::get('/get_invoice/{id}', [App\Http\Controllers\CheckoutController::class, 'get_invoice']);

// Newsletter
Route::post('theme/submit_newslettert', [App\Http\Controllers\HomeController::class, 'newslettertSubmit'])->name('newslettertSubmit');
// testing
Route::get('/test', [App\Http\Controllers\HomeController::class, 'test']);

// Website login
// Route::get('/login', [App\Http\Controllers\WebAuthController::class, 'login'])->name('weblogin');
// Route::get('/register', [App\Http\Controllers\WebAuthController::class, 'register'])->name('register');
// Route::get('/forgotpassword', [App\Http\Controllers\WebAuthController::class, 'forgotPassword'])->name('forgotpassword');
// Route::post('/createaccount', [App\Http\Controllers\WebAuthController::class, 'createAccount']);
// Route::post('/weblogin', [App\Http\Controllers\WebAuthController::class, 'webLogin']);
// Route::post('/password-reset-request', [App\Http\Controllers\WebAuthController::class, 'sendResetLink'])->name('resetpassword');

// dashboard login Group
// Route::middleware(['webLoginChk'])->group(function () {
//   Route::get('/dashboard', [App\Http\Controllers\WebAuthController::class, 'dashboard'])->name('dashboard');
//   Route::get('/logout', [App\Http\Controllers\WebAuthController::class, 'weblogout'])->name('weblogout');
// });

include('admin.php');

// Auth::routes();

Route::fallback(function () {
    return redirect('/');
});
