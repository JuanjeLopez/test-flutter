import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:shopx/controllers/cart_controller.dart';
import 'package:shopx/controllers/product_controller.dart';
import 'package:shopx/views/product_tile.dart';
import 'package:badges/badges.dart';

import 'cart.dart';

class HomePage extends StatelessWidget {
  bool showElevatedButtonBadge = true;
  final ProductController productController = Get.put(ProductController());
  final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          GetX<CartController>(builder: (controller) {
            return Badge(
              badgeContent: Text('${cartController.totalAmount}'),
              position: BadgePosition.topEnd(top: 5, end: 5),
              toAnimate: true,
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Get.to(() => ShowCart());
                },
              ),
            );
          })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'EntrevistaTécnica',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                // IconButton(
                //     icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                // IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          )
        ],
      ),
    );
  }
}
