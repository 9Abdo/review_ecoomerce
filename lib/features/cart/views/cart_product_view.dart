import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/widgets/custombutton.dart';

import 'package:review_ecommerce/features/cart/widget/product_buy.dart';
import 'package:review_ecommerce/features/cart/widget/row_price.dart';

class CartProductView extends StatelessWidget {
  const CartProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: AppStyle.titleApp),
        centerTitle: true,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(4.sp),
                    child: ProductBuy(),
                  );
                },
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity.w,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    RowPrice(text: "Sub-Total", price: "1950"),
                    SizedBox(height: 16.h),
                    RowPrice(text: "VAT (%)", price: "0"),
                    SizedBox(height: 16.h),
                    RowPrice(text: "Sub-Total", price: "80"),
                    SizedBox(height: 16.h),
                    Divider(),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text("Total", style: AppStyle.textfield),
                        Spacer(),
                        Text(
                          r'$'
                          "2230",
                          style: AppStyle.textfield,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.sp),
            Custombutton(buttonName: "Add to Cart", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
