import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';

import 'package:review_ecommerce/features/cart/widget/container_icon.dart';
import 'package:review_ecommerce/features/models/cart_modal.dart';

class ProductBuy extends StatefulWidget {
  const ProductBuy({super.key, required this.cartModal});
  final CartModal cartModal;

  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
  int counter = 0;
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
            Imagewidget(
              width: 83.w,
              height: 79.h,
              image: widget.cartModal.thumbnail,
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.cartModal.title.length >= 9)
                  Text(
                    widget.cartModal.title.substring(0, 9),
                    style: AppStyle.textfield,
                  )
                else
                  Text(widget.cartModal.title, style: AppStyle.textfield),
                Spacer(),
                Text("\$${widget.cartModal.price}", style: AppStyle.textfield),
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
                    ContainerIcon(
                      icon: Icons.remove,
                      onTap: () {
                        setState(() {
                          counter--;
                        });
                      },
                    ),
                    SizedBox(width: 8.w),
                    Text("${widget.cartModal.quantity}"),
                    SizedBox(width: 8.w),
                    ContainerIcon(
                      icon: Icons.add,
                      onTap: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
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
