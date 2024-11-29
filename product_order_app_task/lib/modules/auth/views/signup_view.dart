import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/common/utils/utils.dart';
import 'package:product_order_app_task/common/widgets/custom_button.dart';

import '../../../common/theme/color/colors.dart';
import '../widgets/custom_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  customImage(
                    imagePath: "https://i.postimg.cc/nz0YBQcH/Logo-light.png",
                    height: 100,
                    width: 90,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Sign Up",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Column(
                    children: [
                      customTextField(
                        textController: nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(height: 8.0),
                      customTextField(
                        textController: emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(height: 8.0),
                      customTextField(
                        textController: passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(height: 20.0),
                      customButton(
                        onTap: () {},
                        btnText: "Sign Up",
                        height: 45,
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text.rich(
                          const TextSpan(
                            text: "Already have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
