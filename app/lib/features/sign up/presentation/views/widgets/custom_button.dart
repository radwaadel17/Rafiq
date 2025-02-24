import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: colorApp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: TextArabicWithStyle(
            text: 'إنشاء حساب ',
            textsyle:
                Styles.textstyle18.copyWith(color: Colors.white)));
  }
}
