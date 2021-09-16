<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\ProductsController;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', [ProductsController::class, 'index'])->middleware(['auth'])->name('dashboard');

Route::get('/orders', [OrdersController::class, 'showorders'])->middleware(['auth'])->name('orders');

Route::get('/test', [OrdersController::class, 'index'])->middleware(['auth'])->name('test');

Route::post('/dashboard/addproduct', [ProductsController::class, 'addproduct'])->name('addproduct');

require __DIR__.'/auth.php';
