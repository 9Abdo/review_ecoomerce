import 'package:flutter/material.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';

class RowAuth extends StatelessWidget {
  const RowAuth({super.key, required this.text, required this.buttontransfer,required this.onTap});
  final String text;
  final String buttontransfer;
  final void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppStyle.subtitle),
        GestureDetector(
          onTap:onTap ,
          child: Text(buttontransfer, style: AppStyle.textfield)),
      ],
    );
  }
}
