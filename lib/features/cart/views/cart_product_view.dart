import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/core/widgets/custombutton.dart';
import 'package:review_ecommerce/features/services/cart_services.dart';
import 'package:review_ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:review_ecommerce/features/cart/cubit/cart_state.dart';
import 'package:review_ecommerce/features/cart/widget/product_buy.dart';
import 'package:review_ecommerce/features/cart/widget/row_price.dart';

class CartProductView extends StatelessWidget {
  const CartProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(CartServices(dio: Dio()))..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("my_cart".tr(), style: AppStyle.titleApp),
          centerTitle: true,
          scrolledUnderElevation: 0,
          elevation: 0,
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CartFailureState) {
              return Center(child: Text(state.error));
            }

            if (state is CartSuccessfulState) {
              final cart = state.products.first;

              return Padding(
                padding: EdgeInsets.all(24.sp),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(4.sp),
                            child: ProductBuy(cartModal: state.products[index]),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: Colors.grey[100],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          children: [
                            RowPrice(
                              text: "sub_total".tr(),
                              price: cart.total!.toStringAsFixed(1),
                            ),

                            SizedBox(height: 16.h),

                            RowPrice(
                              text:  "discount".tr(),
                              price: (cart.total! - cart.discountedTotal!)
                                  .toStringAsFixed(1),
                            ),

                            SizedBox(height: 16.h),

                            RowPrice(
                              text: "items".tr(),
                              price: cart.totalProducts.toString(),
                            ),

                            SizedBox(height: 16.h),

                            const Divider(),

                            SizedBox(height: 16.h),

                            Row(
                              children: [
                                Text("total".tr(), style: AppStyle.textfield),
                                const Spacer(),
                                Text(
                                  "\$${cart.discountedTotal!.toStringAsFixed(1)}",
                                  style: AppStyle.textfield,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Custombutton(buttonName: "checkout".tr(), onPressed: () {}),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
