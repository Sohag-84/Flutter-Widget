import 'package:flutter/material.dart';

Widget customIconButton({
  required IconData icon,
  required VoidCallback onTap,
  Color iconColor = Colors.white,
}) {
  return InkWell(
    onTap: onTap,
    child: Icon(icon, color: iconColor),
  );
}
