import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/features/account/views/account_view.dart';
import 'package:review_ecommerce/features/cart/views/cart_product_view.dart';
import 'package:review_ecommerce/features/home/views/home_page_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePageView(),
    CartProductView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          color: AppColor.primaycolor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12.r,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: AppColor.primaycolor,
              indicatorColor: Colors.deepOrangeAccent,

              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                return TextStyle(
                  color: Colors.white,
                  fontSize: states.contains(WidgetState.selected)
                      ? 15.sp
                      : 13.sp,
                  fontWeight: states.contains(WidgetState.selected)
                      ? FontWeight.bold
                      : FontWeight.w500,
                );
              }),

              iconTheme: WidgetStateProperty.resolveWith((states) {
                return IconThemeData(
                  color: Colors.white,
                  size: states.contains(WidgetState.selected) ? 28.sp : 24.sp,
                );
              }),
            ),
            child: NavigationBar(
              selectedIndex: currentIndex,

              onDestinationSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              },

              height: 75.h,

              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(Icons.home),
                  icon: const Icon(Icons.home_outlined),
                  label: "home".tr(),
                ),

                NavigationDestination(
                  selectedIcon: const Icon(Icons.shopping_cart),
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: "cart".tr(),
                ),

                NavigationDestination(
                  selectedIcon: const Icon(Icons.person),
                  icon: const Icon(Icons.person_outline),
                  label: "account".tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
