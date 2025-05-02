import 'package:app/core/utlis/app_images.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

class SignUpCustomAppBar extends StatelessWidget {
  const SignUpCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SafeArea(
            child: Row(
              
          children: [
            SizedBox(
              height: 12.h,
              child: Transform(
                  transform: Matrix4.rotationY(math.pi),
                  child:Image.asset(AppImages.blueArrowBack)),
            ),
          ],
        )),
      ),
    );
  }
}


/*


Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextArabicWithStyle(
                    text: 'إنشاء حساب جديد', textsyle: Styles.textstyle18),
                TextArabicWithStyle(
                    text: 'ادخل جميع بيناتك حتي تتمكن من إنشاء حساب',
                    textsyle: Styles.textstyle12),
              ],
            ),

*/