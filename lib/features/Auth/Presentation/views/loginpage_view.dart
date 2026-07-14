import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:review_ecommerce/features/Auth/cubit/login_state.dart';
import 'package:review_ecommerce/features/Auth/cubit/logincubit.dart';

class LoginpageView extends StatefulWidget {
  const LoginpageView({super.key});

  @override
  State<LoginpageView> createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<LoginpageView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  bool obscertext = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessState) {
            showSankBar(
              context,
              text: "login_successful".tr(),
              color: Colors.green,
            );
            context.pushReplacement(RouteName.mainHomeName);
          }
          if (state is FailureState) {
            showSankBar(context, text: state.error, color: Colors.red);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoadingState,
            blur: 1,

            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Form(
                  key: formState,
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
                        CustomAppbar(title: "login_to_your_account".tr()),
                        SizedBox(height: 8.h),
                        Text(
                          "its_great_to_see_you_again".tr(),
                          style: AppStyle.subtitle,
                        ),
                        SizedBox(height: 24.sp),
                        Text("user_name".tr(), style: AppStyle.textfield),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hint: "enter_your_email_address".tr(),
                          controller: emailController,
                          //  validator: (value) {
                          //    if (value!.isEmpty) {
                          //      return "This is Field is Requried";
                          //    } else if (!value.endsWith("@gmail.com")) {
                          //      return "Field Must be End With @gmail.com";
                          //    }
                          //    return null;
                          //  },
                        ),
                        SizedBox(height: 16.h),
                        Text("password".tr(), style: AppStyle.textfield),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hint: "enter_your_password".tr(),
                          controller: passwordController,
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return "This is Field is Required";
                          //   } else if (value.length < 8) {
                          //     return "PassWord Must be greater than 8";
                          //   }
                          //   return null;
                          // },
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
                        SizedBox(height: 70.h),
                        Custombutton(
                          buttonName: "log_in".tr(),
                          onPressed: () async {
                            if (formState.currentState!.validate()) {
                              context.read<LoginCubit>().loginCubit(
                                username: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),

                        SizedBox(height: 250.h),
                        RowAuth(
                          text: "dont_have_an_account".tr(),
                          buttontransfer: "sign_up".tr(),
                          onTap: () {
                            context.pushReplacementNamed(RouteName.signUpName);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
