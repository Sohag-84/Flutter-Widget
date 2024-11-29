import 'package:flutter/material.dart';

Widget customTextField({
  required String hintText,
  required TextEditingController textController,
  TextInputType textInputType = TextInputType.text,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: textController,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: const Color(0xFFF5FCF9),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0 * 1.5,
        vertical: 16.0,
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
    keyboardType: textInputType,
    onSaved: (phone) {
      // Save it
    },
  );
}
