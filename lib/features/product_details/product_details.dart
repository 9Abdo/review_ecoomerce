import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/widgets/custombutton.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.image});
  final String image;

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
                  ImageWidget(
                    image: image,
                    width: double.infinity,
                    height: 300,
                  ),
                  SizedBox(height: 16.h),
                  Text("Shoose", style: AppStyle.black24w600),
                  SizedBox(height: 16),
                  Text(
                    "Blue T Shirt . Good for All Men  Good for All Men and  Good for All Men and Suits for All of Them.Blue T Shirt Suits for All of Them.Blue T Shirt and Suits for All of Them.Blue T Shirt  Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
                    style: AppStyle.subtitle,
                  ),
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
                              r'$'
                              "1999",
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
