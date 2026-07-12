import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_ecommerce/core/constants/app_color.dart';
import 'package:review_ecommerce/core/constants/app_style.dart';
import 'package:review_ecommerce/features/models/address_modal.dart';

class ListTileAddress extends StatelessWidget {
  const ListTileAddress({super.key, required this.address});
  final AddressModal address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 100.h,

      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderfield),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: ListTile(
          leading: Icon(Icons.location_on, color: AppColor.subTitleColor),
          title: Text(
            address.title,
            style: AppStyle.textfield,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            address.descrption,
            style: AppStyle.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
