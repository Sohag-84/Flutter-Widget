import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_order_app_task/common/widgets/custom_button.dart';

Widget productContainer({
  required VoidCallback detailsTap,
  required String image,
  required String name,
  required String price,
  required double ratings,
  required VoidCallback addToCart,
  bool isAddedToCart = false,
}) {
  return InkWell(
    onTap: detailsTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black12,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ///image
          Expanded(
            flex: 8,
            child: Image.asset(image),
          ),

          ///product name || price || rating || cart button
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '৳ $price',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                ///ratings bar
                //ratingBar(ratings: ratings),

                customButton(
                  onTap: addToCart,
                  btnText: "Add to Cart",
                  height: 30.h,
                  fontSize: 10.sp,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
