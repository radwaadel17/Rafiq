
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputNum extends StatelessWidget {
  const AppInputNum({
    super.key,
    required this.onChanged,
    required this.controller,
    this.onFieldSubmitted,
    required this.hintText,
  });

  final Function(String p1)? onChanged;
  final TextEditingController? controller;
  final Function(String p1)? onFieldSubmitted;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number, // <-- يفتح لوحة الأرقام
      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // <-- يمنع أي حرف غير الأرقام
      obscureText: false,
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
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      ),
    );
  }
}
