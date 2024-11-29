import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/common/theme/color/colors.dart';
import 'package:product_order_app_task/modules/cart/controller/cart_controller.dart';
import 'package:product_order_app_task/modules/cart/view/cart_view.dart';
import 'package:badges/badges.dart' as badges;

Widget cartIconButton() {
  return GetBuilder<CartController>(
      init: CartController(),
      builder: (CartController controller) {
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: -5, end: 2),
          badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
          badgeContent: Text(
            '${controller.box.length}',
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          child: IconButton(
            onPressed: () {
              Get.to(() => CartView());
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        );
      });
}
