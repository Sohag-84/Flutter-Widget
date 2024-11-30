import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_order_app_task/data/wishlist/wishlist_box.dart';
import 'package:product_order_app_task/data/wishlist/wishlist_model.dart';
import 'package:product_order_app_task/modules/cart/controller/cart_controller.dart';
import 'package:product_order_app_task/modules/profile/controller/profile_controller.dart';
import 'package:product_order_app_task/modules/profile/widgets/wishlist_card.dart';

class WishlistView extends StatelessWidget {
  WishlistView({super.key});

  final controller = Get.put(ProfileController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: WishlistBox.getData().listenable(),
              builder: (context, box, child) {
                return controller.box.isEmpty
                    ? const Expanded(
                        child: Center(
                          child: Text("Data not found"),
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 260,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 12,
                          ),
                          itemCount: box.values.length,
                          itemBuilder: (context, index) {
                            final data =
                                box.values.toList().cast<HiveWishlistProduct>();
                            final product = data[index];
                            return WishlistCard(
                              product: product,
                              cartPress: () {
                                cartController.addToCart(
                                  product: data[index],
                                );
                              },
                            );
                          },
                        ),
                      );
              },
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
