import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelAndTextFieldPassword extends StatelessWidget {
  const LabelAndTextFieldPassword(
      {super.key,
      required this.text,
      required this.hintText,
      this.controller,
      this.onChanged,
      required this.obscureText,
      required this.onPressed});
  final String text;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool obscureText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextArabicWithStyle(
              text: text,
              textsyle:
                  Styles.textstyle18.copyWith(fontWeight: FontWeight.normal)),
          TextFormField(
            obscureText: obscureText,
            onChanged: onChanged,
            controller: controller,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'This field is required';
              } else {
                return null;
              }
            },
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onPressed,
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            ),
          )
        ],
      ),
    );
  }
}
