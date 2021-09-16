<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Pedido;
use Illuminate\Http\Request;

class OrdersController extends Controller
{

    public function addorder(Request $request){


		$order = new Order();

		$jcart = $request->all();

		$order->order = $jcart;

		$order->save();

		$pedido = new Pedido();

        $allorders = Order::get();

        foreach($allorders as $order){
            // $count =count($order);
            $count = count($order['order']);
            $names = [];
                for($i = 0; $i < $count; ++$i){
                    array_push($names, $order['order'][$i]['name']);

                }

            $prices = [];
                for($i = 0; $i < $count; ++$i){

                    array_push($prices, $order['order'][$i]['price']);

                }

            $price = array_sum($prices);



            $pedido->products = $names;
            $pedido->price = $price;

            $pedido->save();



        }

        return response()->json($request, 201);


    }

	public function addlocation(Request $request)
	{
		$order = Order::latest()->first();

		$jloc = $request->all();

		$order->location = $jloc;

		$order->save();

		return response()->json($request, 201);


	}

    public function showorders(){

        $pedidos = Pedido::get();

		$jloc = Order::first()->get('location');






        return view('orders', compact('pedidos', 'jloc'));
    }
}
