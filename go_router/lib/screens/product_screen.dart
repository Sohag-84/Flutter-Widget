import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  final String productName;
  const ProductScreen({
    super.key,
    required this.productName,
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
              "Product Name: $productName",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push("/details/12/$productName/1290.0");
              },
              child: const Text("GO TO DETAILS PAGE"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push("/product/$productName/cart");
              },
              child: const Text("GO TO CART PAGE"),
            ),
          ],
        ),
      ),
    );
  }
}
