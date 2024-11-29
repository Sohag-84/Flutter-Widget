import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/common/list.dart';
import 'package:product_order_app_task/common/widgets/product_card.dart';
import 'package:product_order_app_task/modules/home/part/cart_icon_button.dart';
import 'package:product_order_app_task/modules/profile/view/profile_view.dart';

import '../../cart/controller/cart_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product"),
        actions: [
          cartIconButton(),
          IconButton(
            onPressed: () {
              Get.to(() => const ProfileView());
            },
            icon: const Icon(Icons.person_2_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 260,
              mainAxisSpacing: 8,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) => ProductCard(
              product: productList[index],
              cartPress: () {
                cartController.addToCart(
                  product: productList[index],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
