import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';

class ListviewCategores extends StatefulWidget {
  const ListviewCategores({super.key});

  @override
  State<ListviewCategores> createState() => _ListviewCategoresState();
}

class _ListviewCategoresState extends State<ListviewCategores> {
  List<String> category = ["All", "TShirts", "Jeans", "Shoose"];
  int selctedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final isSelcted = selctedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selctedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: isSelcted ? AppColor.primaycolor : Colors.white60,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: isSelcted
                      ? AppColor.primaycolor
                      : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  category[index],
                  style: isSelcted ? AppStyle.selecttext : AppStyle.textfield,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
