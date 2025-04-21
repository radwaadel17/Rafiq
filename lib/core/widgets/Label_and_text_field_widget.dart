import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_input.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class LabelAndTextField extends StatelessWidget {
  const LabelAndTextField({
    super.key,
    required this.text,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final String text;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextArabicWithStyle(
            text: text,
            textsyle: Styles.textstyle18.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          AppInput(
            onChanged: onChanged,
            controller: controller,
            onFieldSubmitted: onFieldSubmitted,
            hintText: hintText,
          )
        ],
      ),
    );
  }
}
