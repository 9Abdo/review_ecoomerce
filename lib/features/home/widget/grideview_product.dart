import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/features/home/widget/cart_product.dart';
import 'package:review_ecommerce/features/models/home_modal.dart';

class GrideviewProduct extends StatelessWidget {
  const GrideviewProduct({super.key, required this.homeModal});
  final List<Homemodel> homeModal;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: homeModal.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .67.sp,
        crossAxisSpacing: 16.sp,
        mainAxisSpacing: 12.sp,
      ),
      itemBuilder: (context, index) => CartProduct(homeModal: homeModal[index]),
    );
  }
}
