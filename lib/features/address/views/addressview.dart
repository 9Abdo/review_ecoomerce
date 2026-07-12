import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/features/services/address_services.dart';
import 'package:review_ecommerce/features/address/cubit/address_cubit.dart';
import 'package:review_ecommerce/features/address/cubit/address_state.dart';
import 'package:review_ecommerce/features/address/widget/list_tile_address.dart';


class Addressview extends StatelessWidget {
  const Addressview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AddressCubit(AddressServices(dio: Dio()))..getAddresses(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Address",
            style: AppStyle.titleApp,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              SizedBox(height: 8.h),
              Text(
                "Saved Address",
                style: AppStyle.black24w600,
              ),
              SizedBox(height: 14.h),

              Expanded(
                child: BlocBuilder<AddressCubit, AddressState>(
                  builder: (context, state) {
                    if (state is AddressLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is AddressFailureState) {
                      return Center(
                        child: Text(state.error),
                      );
                    }

                    if (state is AddressSuccessfulState) {
                      return ListView.builder(
                        itemCount: state.addresses.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.sp),
                            child: ListTileAddress(
                              address: state.addresses[index],
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}