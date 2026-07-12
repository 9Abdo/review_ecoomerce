import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/features/models/categorymodal.dart';

class ListviewCategores extends StatelessWidget {
  const ListviewCategores({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<Categorymodal> categories;
  final int selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColor.primaycolor
                    : Colors.white60,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: isSelected
                      ? AppColor.primaycolor
                      : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  categories[index].name,
                  style: isSelected
                      ? AppStyle.selecttext
                      : AppStyle.textfield,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}