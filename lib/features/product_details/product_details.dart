import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/helper/show_snackbar.dart';
import 'package:review_ecommerce/core/widgets/custombutton.dart';
import 'package:review_ecommerce/core/widgets/image_widget.dart';

import 'package:review_ecommerce/features/cart/cubit/add_to_cart_cubit.dart';
import 'package:review_ecommerce/features/cart/cubit/add_to_cart_state.dart';

import 'package:review_ecommerce/features/models/home_modal.dart';
import 'package:review_ecommerce/features/services/add_to_cart_services.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.homemodel});

  final Homemodel homemodel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddToCartCubit(AddToCartServices(dio: Dio())),
      child: BlocConsumer<AddToCartCubit, AddToCartState>(
        listener: (context, state) {
          if (state is AddToCartSuccessState) {
            showSankBar(
              context,
              text: "Added To Cart Successfully",
              color: Colors.greenAccent,
            );
          }

          if (state is AddToCartFailureState) {
            showSankBar(context, text: state.error, color: Colors.redAccent);
          }
        },
        builder: (context, state) {
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
                          height: 370.h,
                          image: homemodel.image,
                        ),
                        SizedBox(height: 16.h),

                        Text(
                          homemodel.clothesType,
                          style: AppStyle.black24w600,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 16.h),

                        Text(homemodel.description),

                        SizedBox(height: 130.h),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16.sp),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Divider(),

                        SizedBox(height: 16.h),

                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Price", style: AppStyle.priceStyle),
                                Text(
                                  "\$${homemodel.price}",
                                  style: AppStyle.black24w600,
                                ),
                              ],
                            ),

                            SizedBox(width: 24.w),

                            Expanded(
                              child: state is AddToCartLoadingState
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Custombutton(
                                      buttonName: "Add To Cart",
                                      onPressed: () {
                                        context
                                            .read<AddToCartCubit>()
                                            .addToCart(
                                              productId: homemodel.id,
                                              quantity: 1,
                                            );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
