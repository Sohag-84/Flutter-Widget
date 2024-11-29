import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton({
  required VoidCallback onTap,
  required String btnText,
  double height = 40,
  double fontSize = 13,
  Color color = Colors.red,
  Color fontColor = Colors.white,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: fontSize.sp,
          color: fontColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
