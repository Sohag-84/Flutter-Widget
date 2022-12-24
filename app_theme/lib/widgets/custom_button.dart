import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: Get.isDarkMode == true?Colors.blue:Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text("Click here",style: _textTheme.headline3?.copyWith(
          color: Colors.white,fontSize: 20,
        ),),
      ),
    );
  }
}
