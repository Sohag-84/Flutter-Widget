import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_order_app_task/common/const.dart';
import 'package:product_order_app_task/data/cartlist/cart_box.dart';
import 'package:product_order_app_task/data/cartlist/cartlist_model.dart';
import 'package:product_order_app_task/modules/auth/views/signin_view.dart';
import 'package:product_order_app_task/modules/cart/widgets/subtotal_row.dart';

import '../../../common/widgets/custom_button.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_container.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: CartBoxes.getData().listenable(),
              builder: (context, box, child) {
                return controller.box.isEmpty
                    ? const Expanded(
                        child: Center(
                          child: Text("Data not found"),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: box.values.length,
                          itemBuilder: (context, index) {
                            final data =
                                box.values.toList().cast<HiveCartlistProduct>();
                            final product = data[index];
                            return cartContainer(
                              img: product.img,
                              proName: product.name,
                              price: product.price,
                              incrementTap: () {
                                controller.increaseQuantity(id: product.id);
                              },
                              itemQuantity: product.cartQuantity,
                              decrementTap: () {
                                controller.decreaseQuantity(id: product.id);
                              },
                              deleteTap: () {
                                controller.deleteCartItem(product: product);
                              },
                            );
                          },
                        ),
                      );
              },
            ),
            SizedBox(height: 5.h),

            ///subtotal price
            GetBuilder(builder: (CartController controller) {
              return controller.box.isEmpty
                  ? const SizedBox()
                  : Column(
                      children: [
                        subtotalRow(
                          title: "Subtotal",
                          price: "${controller.totalPrice()}",
                        ),
                        subtotalRow(
                          title: "Total",
                          price: "${controller.totalPrice()}",
                        ),
                        SizedBox(height: 5.h),
                        customButton(
                          height: 48.h,
                          fontSize: 14,
                          onTap: () {
                            if (currentUser != null) {
                              print("User found");
                            } else {
                              Get.to(() => const SignInScreen());
                            }
                          },
                          btnText: "Pay Now",
                        ),
                        SizedBox(height: 10.h),
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }
}
