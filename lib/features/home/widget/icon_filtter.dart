import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';

class IconFiltter extends StatelessWidget {
  const IconFiltter({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColor.primaycolor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Icon(Icons.filter_alt, color: AppColor.whitecolor),
        ),
      ),
    );
  }
}
