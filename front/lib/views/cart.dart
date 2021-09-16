import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/cart_controller.dart';
import 'package:shopx/models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

// String latitudeData = "";
// String longitudeData = "";

// @override
// void initState() {
//   super.initState();
//   getCurrentLocation();
// }

// getCurrentLocation() async {
//   final geoposition = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);

//   setState(() {
//     latitudeData = '${geoposition.latitude}';
//     longitudeData = '${geoposition.longitude}';
//   });
// }

void postRequest(order) async {
  try {
    const urlCart = 'https://appshop.juanjelopezportfolio.es/api/orders';
    final cart = jsonEncode(order);
    final body = cart;

    const headers = {
      "Content-Type": "application/json",
      "Authorization": "application/json"
    };

    final res =
        await http.put(Uri.parse(urlCart), headers: headers, body: body);

    print(res.statusCode);
    // print(geolocation);
    print(body);
  } catch (er) {}
}

void postLocation() async {
  try {
    const urlLoc = 'https://appshop.juanjelopezportfolio.es/api/location';

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final geolocation = jsonEncode(position);
    final body = geolocation;

    const headers = {
      "Content-Type": "application/json",
      "Authorization": "application/json"
    };

    final resloc =
        await http.put(Uri.parse(urlLoc), headers: headers, body: body);

    print(resloc.statusCode);
    // print(geolocation);
    print(body);
  } catch (er) {}
}

class ShowCart extends StatelessWidget {
  final Product product;

  const ShowCart({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return GetX<CartController>(
      init: CartController(),
      initState: (_) {},
      builder: (_) {
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: cartController.totalAmount,
                  itemBuilder: (context, int index) {
                    return Container(
                      child: ListTile(
                        title: Text(cartController.cartItems[index].name),
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    postRequest(cartController.cartItems);
                    postLocation();
                  },
                  child: const Text('Checkout'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
