import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.onChanged,
    required this.controller,
    this.onFieldSubmitted,
    required this.hintText,
    this.suffixIcon,
    this.fillColor,
    this.borderRadius,
  });

  final Function(String p1)? onChanged;
  final TextEditingController? controller;
  final Function(String p1)? onFieldSubmitted;
  final String hintText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      onChanged: onChanged,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
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
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
        filled: true,
        fillColor: fillColor ?? Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
