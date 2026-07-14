import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:review_ecommerce/core/widgets/custom_appBar.dart';
import 'package:review_ecommerce/core/widgets/custom_text_field.dart';
import 'package:review_ecommerce/features/services/category_services.dart';
import 'package:review_ecommerce/features/services/home_services.dart';

import 'package:review_ecommerce/features/home/catagory/cubit/category_cubit.dart';
import 'package:review_ecommerce/features/home/catagory/cubit/category_state.dart';

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
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(HomeServices(dio: Dio()))..getProducts(),
        ),
        BlocProvider(
          create: (_) =>
              CategoryCubit(GategoryServices(dio: Dio()))..getCategories(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(24.sp),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is FailureState) {
                  return Center(child: Text(state.error));
                }

                if (state is SuccessfulState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppbar(title: "discover".tr()),

                      SizedBox(height: 16.h),

                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hint: "search".tr(),
                              prefixicon: const Icon(Icons.search),
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

                      if (showCategories)
                        BlocBuilder<CategoryCubit, CategoryState>(
                          builder: (context, categoryState) {
                            if (categoryState is GayegoryLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (categoryState is GayegoryFailureState) {
                              return Center(child: Text(categoryState.error));
                            }

                            if (categoryState is GayegorySuccessfulState) {
                              return ListviewCategores(
                                categories: categoryState.category,
                                selectedIndex: selectedCategory,
                                onTap: (index) {
                                  setState(() {
                                    selectedCategory = index;
                                  });
                                  if (index == 0) {
                                    context.read<HomeCubit>().getProducts();
                                  } else {
                                    context
                                        .read<HomeCubit>()
                                        .getProductsByCategory(
                                          categoryState.category[index].id,
                                        );
                                  }
                                },
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),

                      SizedBox(height: 24.h),

                      Expanded(
                        child: GrideviewProduct(homeModal: state.products),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
