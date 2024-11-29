import 'package:flutter/material.dart';

Row customOrderRow({
  required String title,
  required String status,
}) {
  return Row(
    children: [
      Text(
        "$title ",
        style: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        status,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
