import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';

class ListTileCart extends StatelessWidget {
  const ListTileCart({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    
  });
  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColor.secondColor),
      title: Text(text, style: AppStyle.textfield),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 24.sp,
        color: AppColor.subTitleColor,
      ),
    );
  }
}
