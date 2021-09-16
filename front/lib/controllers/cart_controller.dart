// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/state_manager.dart';
import 'package:shopx/models/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;
  int get totalAmount => cartItems.length;

  addToCart(Product product) {
    cartItems.add(product);

    String jsonProduct = jsonEncode(product);
    return print(jsonProduct);
  }

}
