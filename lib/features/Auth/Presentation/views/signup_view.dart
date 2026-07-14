import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/helper/show_snackbar.dart';
import 'package:review_ecommerce/core/routing/app_route.dart';
import 'package:review_ecommerce/core/widgets/custom_appBar.dart';
import 'package:review_ecommerce/core/widgets/custom_text_field.dart';
import 'package:review_ecommerce/core/widgets/custombutton.dart';
import 'package:review_ecommerce/features/Auth/Presentation/widgets/row_auth.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool obscertext = true;
  bool obscertext_2 = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: formstate,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (context.locale.languageCode == 'en') {
                            await context.setLocale(const Locale('ar'));
                          } else {
                            await context.setLocale(const Locale('en'));
                          }
                        },
                        child: Text("switch Language"),
                      ),
                    ),
                    CustomAppbar(title: "create_an_account".tr()),
                    SizedBox(height: 8.h),
                    Text(
                      "lets_create_your_account".tr(),
                      style: AppStyle.subtitle,
                    ),
                    SizedBox(height: 24.sp),
                    Text("full_name".tr(), style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: fullNameController,
                      hint: "enter_your_full_name".tr(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required_field".tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text("user_name".tr(), style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: emailController,
                      hint: "enter_your_email_address".tr(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required_field".tr();
                        } else if (!value.endsWith("@gmail.com")) {
                          return "email_must_end_with_gmail".tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text("password".tr(), style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: passwordController,
                      hint: "enter_your_password".tr(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required_field".tr();
                        } else if (value.length < 8) {
                          return "password_must_be_greater_than_8".tr();
                        }
                        return null;
                      },
                      obscureText: obscertext,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscertext = !obscertext;
                          });
                        },
                        icon: obscertext
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text("confirm_password".tr(), style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hint: "enter_your_confirm_password".tr(),
                      controller: confirmpassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "required_field".tr();
                        } else if (value.length < 8) {
                          return "password_must_be_greater_than_8".tr();
                        } else if (value.toString() !=
                            passwordController.text) {
                          return "confirm_password_must_match".tr();
                        }
                        return null;
                      },
                      obscureText: obscertext_2,
                      icon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscertext_2 = !obscertext_2;
                          });
                        },
                        icon: obscertext_2
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Custombutton(
                      buttonName: "create_account".tr(),
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await Future.delayed(Duration(seconds: 2));
                          setState(() {
                            isLoading = false;
                          });

                          showSankBar(
                            context,
                            text: "successful".tr(),
                            color: Colors.greenAccent,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 70.h),
                    RowAuth(
                      text: "already_have_an_account".tr(),
                      buttontransfer: "log_in".tr(),
                      onTap: () {
                        context.pushReplacementNamed(RouteName.loginName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
