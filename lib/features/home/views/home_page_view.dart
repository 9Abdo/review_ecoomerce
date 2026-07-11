import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:review_ecommerce/core/widgets/custom_appBar.dart';
import 'package:review_ecommerce/core/widgets/custom_text_field.dart';
import 'package:review_ecommerce/features/Auth/services/home_services.dart';
import 'package:review_ecommerce/features/home/cubit/home_cubit.dart';
import 'package:review_ecommerce/features/home/cubit/home_state.dart';

import 'package:review_ecommerce/features/home/widget/grideview_product.dart';
import 'package:review_ecommerce/features/home/widget/icon_filtter.dart';
import 'package:review_ecommerce/features/home/widget/listview_categores.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  bool showCategories = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeServices(dio: Dio()))..getProducts(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(24.sp),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is FailureState) {
                  return Center(child: Text(state.error));
                }
                if(state is SuccessfulState){
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppbar(title: "Discover"),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hint: "Search",
                            prefixicon: Icon(Icons.search),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        IconFiltter(
                          onTap: () {
                            setState(() {
                              showCategories = !showCategories;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    showCategories
                        ? const ListviewCategores()
                        : const SizedBox.shrink(),
                    SizedBox(height: 24.h),
                    Expanded(child: GrideviewProduct(homeModal: state.products,)),
                  ],
                );
                }
                return SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
