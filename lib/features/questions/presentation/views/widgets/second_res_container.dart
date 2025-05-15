import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SecondsResultContainer extends StatelessWidget {
  const SecondsResultContainer({
    super.key, required this.txt, required this.probality, required this.degree, required this.totalDegree,
  });
  final String txt ;
  final double probality; 
  final double degree ;
  final double totalDegree ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: secondaryColor , 
          borderRadius: BorderRadius.circular(20.r),
      
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(txt, style: Styles.textstyle18),
              Gap(10.h),
              Text("${probality.toStringAsFixed(2)}%", style: Styles.textstyle16),
              Gap(10.h),
              Text("(${degree.toStringAsFixed(2)} من $totalDegree درجة)", style: Styles.textstyle14.copyWith(color: Colors.black)),
              
            ],
          ),
        ),
      ),
    );
  }
}
