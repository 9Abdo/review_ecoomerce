import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/features/account/widget/list_tile_cart.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account", style: AppStyle.titleApp),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            Divider(),
            SizedBox(height: 8.sp),
            ListTileCart(icon: Icons.card_membership_sharp, text: "My Order"),
            Divider(thickness: 3.sp, color: AppColor.subTitleColor),
            SizedBox(height: 8.sp),
            ListTileCart(icon: Icons.person, text: "Edit Person"),
            Divider(),
            SizedBox(height: 8.sp),
            ListTileCart(icon: Icons.home, text: "Address Book"),
            Divider(),
            SizedBox(height: 8.sp),
            ListTileCart(icon: Icons.question_mark_sharp, text: "FAQs"),
            Divider(),
            SizedBox(height: 8.sp),
            ListTileCart(icon: Icons.help_center_rounded, text: "Help Center"),
          ],
        ),
      ),
    );
  }
}
