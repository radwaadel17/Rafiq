import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class MessagesHeader extends StatelessWidget {
  const MessagesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              hintStyle: Styles.textstyle12
                  .copyWith(color: colorApp.withOpacity(0.76)),
              hintText: 'البحث عن محادثة',
              fillColor: secondaryColor,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r), // زوايا مدورة
                borderSide: BorderSide.none, // بدون حدود
              ),
            ),
          )),
          SizedBox(width: 24.w),
          SizedBox(
              height: 12.h,
              child: Transform(
                  transform: Matrix4.rotationY(math.pi),
                  child: Image.asset(AppImages.blueArrowBack))),
          SizedBox(width: 32.w),
        ],
      ),
    ));
  }
}
