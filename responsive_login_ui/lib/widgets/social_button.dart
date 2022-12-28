import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_login_ui/constant/colors.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double horizontalPadding;
  final VoidCallback onPressed;
  const SocialButton({
    Key? key,
    required this.iconPath,
    required this.label,
    this.horizontalPadding = 100,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(iconPath, width: 25, color: whiteColor),
      label: Text(
        label,
        style: const TextStyle(fontSize: 17, color: whiteColor),
      ),
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 30, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
