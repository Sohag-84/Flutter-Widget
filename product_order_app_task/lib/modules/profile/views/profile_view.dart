import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/modules/auth/controller/auth_controller.dart';
import 'package:product_order_app_task/modules/profile/views/my_order_view.dart';
import 'package:product_order_app_task/modules/profile/views/wishlist_view.dart';
import '../part/profile_pic_section.dart';
import '../widgets/porfile_menu.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Oder",
              icon: Icons.storefront_outlined,
              press: () {
                Get.to(() => MyOrderView());
              },
            ),
            ///wishlist
            ProfileMenu(
              text: "Wishlist",
              icon: Icons.favorite_border,
              press: () {
                Get.to(()=>WishlistView());
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: Icons.notifications_none_outlined,
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: Icons.help_outline,
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: Icons.logout_outlined,
              press: () async {
                await authController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
