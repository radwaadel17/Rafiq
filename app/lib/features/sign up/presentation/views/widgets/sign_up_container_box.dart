import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpContainerBox extends StatelessWidget {
  const SignUpContainerBox({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.060,
      width: context.screenWidth * 0.36,
      decoration: BoxDecoration(
        border: Border.all(color: colorApp),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h, child: Image.asset(image)),
          TextArabicWithStyle(text: 'المتابعة ب ', textsyle: Styles.textstyle16)
        ],
      ),
    );
  }
}