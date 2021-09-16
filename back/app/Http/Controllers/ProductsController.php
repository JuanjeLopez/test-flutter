<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function index(){

        $products = Product::get();
        $orders = Order::get();

        return view('dashboard', compact('products', 'orders'));
    }

    public function addproduct(Request $request){

        $product = new Product();

        $product->name = $request->name;
        $product->description = $request->description;
        $product->price = $request->price;


        $product->save();

        return back();
    }

    public function apiproducts()
    {
        return Product::all();
    }
}
