import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Screen"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.push("/product/t-shirt");
              },
              child: const Text("GO TO PRODUCT"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  "profile",
                  pathParameters: {
                    "userId": "1234",
                    "username": "Injamul haq",
                  },
                );
              },
              child: const Text("GO TO PROFILE VIEW"),
            ),
          ],
        ),
      ),
    );
  }
}
