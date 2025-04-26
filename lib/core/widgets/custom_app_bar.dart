import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.txt});
   final String txt ;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Row(
          children: [
            const Spacer(flex: 3,),
            TextArabicWithStyle(text: txt, textsyle: Styles.textstyle22.copyWith(fontWeight: FontWeight.w500)),
            const Spacer(flex: 2,),
             SizedBox(
              height: 12.h,
              child: Image.asset(AppImages.blueArrowBack)),
             const  Spacer(flex: 1,),
          ],
        ),
      )
      );
  }
}