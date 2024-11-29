import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_order_app_task/common/asset/assets.dart';
import 'package:product_order_app_task/common/widgets/custom_button.dart';
import 'package:product_order_app_task/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.cartPress,
  });

  final Product product;
  final VoidCallback cartPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF979797).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(product.images),
        ),
        const SizedBox(height: 8),
        Text(
          product.title,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF7643),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: product.isFavourite
                      ? const Color(0xFFFF7643).withOpacity(0.15)
                      : const Color(0xFF979797).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.string(
                  heartIcon,
                  colorFilter: ColorFilter.mode(
                    product.isFavourite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        customButton(
          onTap: cartPress,
          btnText: "Cart",
          color: Colors.red.withOpacity(.7),
          height: 35,
          fontSize: 12,
        )
      ],
    );
  }
}
