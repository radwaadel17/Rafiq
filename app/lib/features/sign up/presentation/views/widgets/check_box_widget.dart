import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                children: [
    Row(
      children: [
        TextArabicWithStyle(
            text: ' الشروط والأحكـام',
            textsyle: Styles.textstyle12.copyWith(fontSize: 14.sp , color: colorApp)),
        TextArabicWithStyle(
            text: 'اوافق على',
            textsyle: Styles.textstyle12
                .copyWith(fontSize: 14.sp)),
        Checkbox(
          value: false, onChanged: (newValue) {},
          shape: RoundedRectangleBorder(
            // جعل الـ Checkbox دائري الزوايا
            borderRadius:
                BorderRadius.circular(6), // التحكم في التدوير
          ),
          side: const BorderSide(
              color: colorApp, width: 2), // لون الإطار
        ),
      ],
    )
                ],
              );
  }
}
