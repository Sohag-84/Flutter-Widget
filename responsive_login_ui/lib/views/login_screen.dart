// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_login_ui/widgets/login_field.dart';
import 'package:responsive_login_ui/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/signin_balls.png"),
              Text(
                "Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(height: 50),
              SocialButton(
                iconPath: "assets/svgs/g_logo.svg",
                label: "Continue with Google",
              ),
              SizedBox(height: 20),
              SocialButton(
                iconPath: "assets/svgs/f_logo.svg",
                label: "Continue with Facebook",
                horizontalPadding: 90,
                onPressed: () {},
              ),
              SizedBox(height: 15),
              Text("OR", style: TextStyle(fontSize: 17)),
              SizedBox(height: 15),
              LoginField(hintText: "Email"),
              SizedBox(height: 15),
              LoginField(hintText: "Password"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
