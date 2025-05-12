import 'package:app/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckContainer extends StatelessWidget {
  const CheckContainer({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 20.h,
        width: 20.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(
              color: isSelected ? colorApp : greyColor,
            )),
        child: Container(
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color: isSelected ? greenColor : Colors.white),
        ),
      ),
    );
  }
}