import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: Text("error occur $error"),
      ),
    );
  }
}
