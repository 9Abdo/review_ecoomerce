import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:review_ecommerce/core/routing/app_route.dart';
import 'package:review_ecommerce/features/Auth/Presentation/views/signup_view.dart';
import 'package:review_ecommerce/features/Auth/Presentation/views/loginpage_view.dart';
import 'package:review_ecommerce/features/Auth/cubit/logincubit.dart';
import 'package:review_ecommerce/features/Auth/services/user_services.dart';
import 'package:review_ecommerce/features/home/views/main_home_view.dart';
import 'package:review_ecommerce/features/product_details/product_details.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutePath.loginPath,
  routes: [
    GoRoute(
      path: RoutePath.loginPath,
      name: RouteName.loginName,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(userServices: UserServices(dio: Dio())),
        child: LoginpageView(),
      ),
    ),
    GoRoute(
      path: RoutePath.signUpPath,
      name: RouteName.signUpName,
      builder: (context, state) => SignupView(),
    ),
    GoRoute(
      path: RoutePath.mainHomePath,
      name: RouteName.mainHomeName,
      builder: (context, state) => MainHomeView(),
    ),
    GoRoute(
      path: RoutePath.productDetailsPath,
      name: RouteName.productDetailsName,

      builder: (context, state) {
        final String image = state.extra as String;
        return ProductDetails(image: image);
      },
    ),
  ],
);
