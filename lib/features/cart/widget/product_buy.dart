import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';
import 'package:review_ecommerce/features/cart/widget/container_icon.dart';

class ProductBuy extends StatelessWidget {
  const ProductBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 107.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColor.subTitleColor),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Row(
          children: [
            ImageWidget(
              image: "Assets/images/shose.jpg",
              width: 83,
              height: 79,
              radius: 4,
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shoose", style: AppStyle.textfield),
                Spacer(),
                Text(
                  r'$'
                  "1989",
                  style: AppStyle.textfield,
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete_outline, color: Colors.red),
                ),
                Spacer(),

                Row(
                  children: [
                    ContainerIcon(icon: Icons.remove),
                    SizedBox(width: 8.w),
                    Text("1"),
                    SizedBox(width: 8.w),
                    ContainerIcon(icon: Icons.add),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
