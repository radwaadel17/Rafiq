import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.txt});
   final String txt ;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h , horizontal: 16.w),
        child: Row(
          children: [
            const Spacer(flex: 3,),
            TextArabicWithStyle(text: txt, textsyle: Styles.textstyle22.copyWith(fontWeight: FontWeight.w500)),
            const Spacer(flex: 2,),
             SizedBox(
              height: 12.h,
              child: Transform(
                transform: Matrix4.rotationY(math.pi),
                child: Image.asset(AppImages.blueArrowBack))),
             const  Spacer(flex: 1,),
          ],
        ),
      )
      );
  }
}