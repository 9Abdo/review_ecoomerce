import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/routing/app_route.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';
import 'package:review_ecommerce/features/models/home_modal.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key, required this.homeModal});
  final Homemodel homeModal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteName.productDetailsName, extra: homeModal);
      },
      child: Container(
        width: 161.w,
        height: 240.h,
        color: AppColor.whitecolor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Imagewidget(
              width: 161,
              height: 174,
              image: homeModal.image,
            ),
            SizedBox(height: 8.h),
            Text(
              homeModal.clothesType,
              style: AppStyle.textfield,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Expanded(
              child: Text("${homeModal.price}\$", style: AppStyle.priceStyle),
            ),
          ],
        ),
      ),
    );
  }
}
