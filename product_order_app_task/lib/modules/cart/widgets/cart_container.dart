import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_order_app_task/common/theme/color/colors.dart';
import 'quantity_icon_button.dart';

Container cartContainer({
  required String img,
  required String proName,
  required String price,
  required VoidCallback incrementTap,
  required int itemQuantity,
  required VoidCallback decrementTap,
  required VoidCallback deleteTap,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5.h),
    padding: EdgeInsets.symmetric(
      horizontal: 5.w,
      vertical: 2.h,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      boxShadow: const [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black12,
          offset: Offset(2, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Image.network(
          img,
          height: 100.h,
          width: 100.w,
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///name
              Text(
                proName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              ///price
              Text(
                "Price: ৳$price",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.w),

              ///increment & decrement quantity
              Container(
                width: 120.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customIconButton(
                      icon: Icons.remove,
                      onTap: decrementTap,
                    ),
                    Text(
                      "$itemQuantity",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    customIconButton(
                      icon: Icons.add,
                      onTap: incrementTap,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 5.w),

        ///delete cart item button
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor.withOpacity(.10),
          ),
          child: customIconButton(
            icon: Icons.delete_forever_outlined,
            iconColor: AppColors.primaryColor,
            onTap: deleteTap,
          ),
        )
      ],
    ),
  );
}
