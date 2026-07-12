import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/routing/app_route.dart';
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
            SizedBox(height: 5.h),
            ListTileCart(icon: Icons.card_membership_sharp, text: "My Order"),
            Divider(thickness: 3.sp, color: AppColor.subTitleColor),
            SizedBox(height: 5.h),
            ListTileCart(icon: Icons.person, text: "Edit Person"),
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(
              icon: Icons.home,
              text: "Address Book",
              onTap: () => context.pushNamed(RouteName.addreessName),
            ),
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(icon: Icons.question_mark_sharp, text: "FAQs"),
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(icon: Icons.help_center_rounded, text: "Help Center"),
            SizedBox(height: 5.h),
            Divider(thickness: 3.sp, color: AppColor.borderfield),
            Spacer(),
            ListTile(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.scale,
                  title: "Log Out",
                  desc: "Are you sure you want to log out?",
                  btnCancelText: "Cancel",
                  btnCancelColor: Colors.greenAccent,
                  btnCancelOnPress: () {},
                  btnOkText: "Log Out",
                  btnOkColor: Colors.red,

                  btnOkOnPress: () {
                    context.goNamed(RouteName.loginName);
                  },
                ).show();
              },
              leading: Icon(Icons.logout, color: Colors.red, size: 24.sp),
              title: Text(
                "Log out",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
