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
            showSankBar(context, text: "Login Successful", color: Colors.green);
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
                        CustomAppbar(title: "Login to your account"),
                        SizedBox(height: 8.h),
                        Text(
                          "It’s great to see you again.",
                          style: AppStyle.subtitle,
                        ),
                        SizedBox(height: 24.sp),
                        Text("User Name", style: AppStyle.textfield),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hint: "Enter your email address",
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
                        Text("PassWord", style: AppStyle.textfield),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hint: "Enter your Password",
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
                          buttonName: "Log in",
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
                          text: "Don’t have an account? ",
                          buttontransfer: "Sign Up",
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
