import 'package:flutter/material.dart';
import 'package:product_order_app_task/common/list.dart';
import 'package:product_order_app_task/common/widgets/product_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Product"),
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
              cartPress: () {},
            ),
          ),
        ),
      ),
    );
  }
}
