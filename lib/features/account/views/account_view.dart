import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/helper/cach_helper.dart';
import 'package:review_ecommerce/core/routing/app_route.dart';
import 'package:review_ecommerce/features/account/widget/list_tile_cart.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("account".tr(), style: AppStyle.titleApp),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(
              icon: Icons.card_membership_sharp,
              text: "my_order".tr(),
            ),
            Divider(thickness: 3.sp, color: AppColor.subTitleColor),
            SizedBox(height: 5.h),
            ListTileCart(icon: Icons.person, text: "edit_person".tr()),
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(
              icon: Icons.home,
              text: "address_book".tr(),
              onTap: () => context.pushNamed(RouteName.addreessName),
            ),
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(icon: Icons.question_mark_sharp, text: "fAQs".tr()),
            Divider(),
            SizedBox(height: 5.h),
            ListTileCart(
              icon: Icons.help_center_rounded,
              text: "help_center".tr(),
            ),
            SizedBox(height: 5.h),
            Divider(thickness: 3.sp, color: AppColor.borderfield),
            SizedBox(height: 5.h),
            ListTileCart(
              icon: Icons.translate,
              text: "translate".tr(),
              onTap: () async {
                if (context.locale.languageCode == 'en') {
                  await context.setLocale(const Locale('ar'));
                } else {
                  await context.setLocale(const Locale('en'));
                }
              },
            ),
            Spacer(),
            ListTile(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.warning,
                  animType: AnimType.scale,
                  title: "log_out".tr(),
                  desc: "are_you_sure_you_want_to_log_out?".tr(),
                  btnCancelText: "cancel".tr(),
                  btnCancelColor: Colors.grey,
                  btnCancelOnPress: () {},
                  btnOkText: "log_out".tr(),
                  btnOkColor: Colors.red,

                  btnOkOnPress: () {
                    CachHelper.deleteToken();
                    context.goNamed(RouteName.loginName);
                  },
                ).show();
              },
              leading: Icon(Icons.logout, color: Colors.red, size: 24.sp),
              title: Text(
                "log_out".tr(),
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
