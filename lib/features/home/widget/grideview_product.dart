import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/features/home/widget/cart_product.dart';

class GrideviewProduct extends StatelessWidget {
  const GrideviewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .66.sp,
        crossAxisSpacing: 16.sp,
        mainAxisSpacing: 10.sp,
      ),
      itemBuilder: (context, index) => CartProduct(),
    );
  }
}
