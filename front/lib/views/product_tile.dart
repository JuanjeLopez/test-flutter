import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/cart_controller.dart';
import 'package:shopx/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                    'images/image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   right: 0,
                //   child: Obx(() => CircleAvatar(
                //         backgroundColor: Colors.white,
                //         child: IconButton(
                //           icon: product.isFavorite.value
                //               ? Icon(Icons.favorite_rounded)
                //               : Icon(Icons.favorite_border),
                //           onPressed: () {
                //             product.isFavorite.toggle();
                //           },
                //         ),
                //       )),
                // )
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text('${product.price}\€',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
            ElevatedButton(
              style: style,
              onPressed: () {
                cartController.addToCart(product);
              },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
