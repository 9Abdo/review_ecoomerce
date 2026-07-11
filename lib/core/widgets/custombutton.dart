import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50,
  });
  final String buttonName;
  final void Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height!.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10.r),
          ),
        ),
        child: Text(buttonName, style: AppStyle.buttonStyle),
      ),
    );
  }
}
