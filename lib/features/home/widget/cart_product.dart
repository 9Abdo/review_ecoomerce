import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/routing/app_route.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RouteName.productDetailsName,
          extra: "Assets/images/shose.jpg",
        );
      },
      child: Container(
        width: 161.w,
        height: 240.h,
        color: AppColor.whitecolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              image: "Assets/images/shose.jpg",
              width: 161,
              height: 174,
            ),
            SizedBox(height: 8.h),
            Text("Shoose", style: AppStyle.textfield),
            SizedBox(height: 4.h),
            Expanded(
              child: Text(
                r'$'
                "1990",
                style: AppStyle.priceStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
