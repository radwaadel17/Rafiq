import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnavalibaleContainer extends StatelessWidget {
  const UnavalibaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        height: context.screenHeight * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: secondaryColor,
        ),
        child: Center(
          child: Text(
            'غير متاح',
            style: Styles.textstyle14,
          ),
        ),
      ),
    );
  }
}
