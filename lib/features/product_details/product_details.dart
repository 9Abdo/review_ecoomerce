import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/widgets/custombutton.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';
import 'package:review_ecommerce/features/models/home_modal.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.homemodel});
  final Homemodel homemodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details", style: AppStyle.titleApp),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Imagewidget(
                    width: double.infinity,
                    height: 370,
                    image: homemodel.image,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    homemodel.clothesType,
                    style: AppStyle.black24w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16),
                  Text(homemodel.description),
                  SizedBox(height: 130.h),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    Divider(),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Price", style: AppStyle.priceStyle),
                            Text(
                              "${homemodel.price}\$",
                              style: AppStyle.black24w600,
                            ),
                          ],
                        ),
                        SizedBox(width: 24.h),
                        Expanded(
                          child: Custombutton(
                            buttonName: "Check Out",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
