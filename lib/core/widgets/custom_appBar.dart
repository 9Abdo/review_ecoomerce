import 'package:flutter/material.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppStyle.titleApp);
  }
}
