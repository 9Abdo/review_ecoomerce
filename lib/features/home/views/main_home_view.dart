import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/features/account/views/account_view.dart';
import 'package:review_ecommerce/features/cart/views/cart_product_view.dart';
import 'package:review_ecommerce/features/home/views/home_page_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int _currentIndex = 0;

  final List<Widget> pages = const [
    HomePageView(),
    CartProductView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],

      bottomNavigationBar: CircleNavBar(
        activeIndex: _currentIndex,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        activeIcons: [
          Icon(Icons.home, color: AppColor.whitecolor),
          Icon(Icons.shopping_cart, color: AppColor.whitecolor),
          Icon(Icons.person, color: AppColor.whitecolor),
        ],

        inactiveIcons: const [
          Icon(Icons.home_outlined, color: AppColor.whitecolor),
          Icon(Icons.shopping_cart, color: AppColor.whitecolor),
          Icon(Icons.person_outline, color: AppColor.whitecolor),
        ],

        levels: const ["Home", "Cart", "Account"],

        activeLevelsStyle: AppStyle.selecttext,

        color: AppColor.primaycolor,
        circleColor: Colors.deepOrangeAccent,
        height: 90.h,
        circleWidth: 55.w,

        elevation: 0,

        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
