  import 'package:flutter/material.dart';

Widget customTextField({
    required String hintText,
    required TextEditingController textController,
  }) {
    return TextFormField(
      controller: textController,
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
      keyboardType: TextInputType.phone,
      onSaved: (phone) {
        // Save it
      },
    );
  }
