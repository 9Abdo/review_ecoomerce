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
                   CustomAppbar(title: "Create an account"),
                    SizedBox(height: 8.h),
                    Text(
                      "Let’s create your account.",
                      style: AppStyle.subtitle,
                    ),
                    SizedBox(height: 24.sp),
                    Text("Full Name", style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: fullNameController,
                      hint: "Enter your Full Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Requried";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text("User Name", style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: emailController,
                      hint: "Enter your Email address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Requried";
                        } else if (!value.endsWith("@gmail.com")) {
                          return "Field Must be End With @gmail.com";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Text("PassWord", style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: passwordController,
                      hint: "Enter your Password",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Required";
                        } else if (value.length < 8) {
                          return "PassWord Must be greater than 8";
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
                    Text("Confirm PassWord", style: AppStyle.textfield),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      hint: "Enter your Confirm Password",
                      controller: confirmpassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "This is Field is Required";
                        } else if (value.length < 8) {
                          return "PassWord Must be greater than 8";
                        } else if (value.toString() !=
                            passwordController.text) {
                          return "Confirm Password Must be match Password";
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
                      buttonName: "Create Account",
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
                            text: "Successful",
                            color: Colors.greenAccent,
                          );
                        }
                      },
                    ),
                    SizedBox(height: 70.h),
                    RowAuth(
                      text: "Already have an account? ",
                      buttontransfer: "Log in",
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
