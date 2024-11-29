import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/common/theme/color/colors.dart';
import 'package:product_order_app_task/models/order_model.dart';
import 'package:product_order_app_task/services/order_services.dart';
import 'package:intl/intl.dart';

import '../../cart/controller/cart_controller.dart';
import '../widgets/custom_order_row.dart';

class MyOrderView extends StatelessWidget {
  MyOrderView({super.key});

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: FutureBuilder<List<Order>>(
        future: fetchUserOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to load orders"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No orders found"));
          }

          final orders = snapshot.data!;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.h,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(.05),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customOrderRow(
                            title: "Order ID:",
                            status: order.id,
                          ),
                          customOrderRow(
                            title: "Order Date:",
                            status: DateFormat('d MMM, hh:mm a')
                                .format(order.orderDate),
                          ),
                          customOrderRow(
                            title: "Status:",
                            status: order.orderStatus,
                          ),
                        ],
                      ),
                      Text("৳ ${order.totalPrice}"),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
