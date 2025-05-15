import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    super.key, required this.precentage, required this.prediction,
  });
  final double precentage;
  final String prediction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          children: [
            Gap(20.h),
            Text(" 📊 النتيجـــة", style: Styles.textstyle18),
            Gap(10.h),
            Text(prediction, style: Styles.textstyle18),
            Gap(10.h),
            Text("${precentage.toStringAsFixed(2)} %", 
                style: Styles.textstyle18.copyWith(color: greenColor)),
            Gap(20.h),
          ],
        ),
      ),
    );
  }
}
