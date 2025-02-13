import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int productId;
  final String productName;
  final double productPrice;
  const DetailsScreen({
    super.key,
    required this.productId,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Product ID: $productId",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Product Name: $productName",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Product Price: $productPrice",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
