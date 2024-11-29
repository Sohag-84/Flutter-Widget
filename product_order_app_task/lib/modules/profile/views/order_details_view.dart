import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_order_app_task/common/utils/utils.dart';

import '../widgets/status_timeline.dart';

class OrderDetailsView extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final String totalPrice;
  final String status;
  const OrderDetailsView({
    super.key,
    required this.items,
    required this.totalPrice,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),

          ///status time line
          SizedBox(
            height: 70.h,
            child: Row(
              children: [
                StatusTimeLine(
                  isFirst: true,
                  isLast: false,
                  isPast: status == 'pending' ||
                          status == "confirmed" ||
                          status == "on_delivery" ||
                          status == "delivered"
                      ? true
                      : false,
                  statusText: "Pending",
                ),
                StatusTimeLine(
                  isFirst: false,
                  isLast: false,
                  isPast: status == "confirmed" ||
                          status == "on_delivery" ||
                          status == "delivered"
                      ? true
                      : false,
                  statusText: "Confirmed",
                ),
                StatusTimeLine(
                  isFirst: false,
                  isLast: false,
                  isPast: status == "on_delivery" || status == "delivered"
                      ? true
                      : false,
                  statusText: "On delivery",
                ),
                StatusTimeLine(
                  isFirst: false,
                  isLast: true,
                  isPast: status == "delivered" ? true : false,
                  statusText: "Delivered",
                ),
              ],
            ),
          ),

          ///total price
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                Text(
                  "Total Price: ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "৳ $totalPrice",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),

          ///ordered product list
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index];
                return Container(
                  margin: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                    bottom: 5.h,
                  ),
                  child: Row(
                    children: [
                      customImage(
                        imagePath: data['image'],
                        height: 90.h,
                        width: 80.w,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data['name']}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              "Price: ৳ ${data['price']}",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Text(
                              "Quantity: ${data['quantity']}",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
