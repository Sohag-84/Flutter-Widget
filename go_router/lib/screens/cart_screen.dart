import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final String productName;
  const CartScreen({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Product Name: $productName",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
