import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_order_app_task/common/theme/color/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class StatusTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String statusText;
  const StatusTimeLine({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.h,
      child: TimelineTile(
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.start,
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? AppColors.primaryColor : Colors.grey,
        ),
        indicatorStyle: IndicatorStyle(
          height: 30.h,
          color: isPast ? AppColors.primaryColor : Colors.grey,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : Colors.grey,
          ),
        ),
        endChild: Container(
          margin: EdgeInsets.all(5.h),
          child: Text(
            statusText,
            style: TextStyle(
              color: isPast
                  ? AppColors.primaryColor.withOpacity(.70)
                  : AppColors.primaryColor.withOpacity(.30),
              fontSize: 12.sp,
              fontWeight: isPast ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
