import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddtionalInfoContainer extends StatelessWidget {
  const AddtionalInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        height: context.screenHeight * 0.052,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            '📋 معلومات إضافية',
            style: Styles.textstyle18,
          ),
        ),
      ),
    );
  }
}
