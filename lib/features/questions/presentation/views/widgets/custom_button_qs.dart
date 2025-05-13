import 'package:app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonQs extends StatelessWidget {
  const CustomButtonQs({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  final String? txt;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      left: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: CustomButton(
          onPressed: onPressed,
          text: txt!,
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
