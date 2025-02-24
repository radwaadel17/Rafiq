import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelAndTextField extends StatelessWidget {
  const LabelAndTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextArabicWithStyle(
              text: 'الأسم بالكامل',
              textsyle:
                  Styles.textstyle18.copyWith(fontWeight: FontWeight.normal)),
          TextFormField(
            textAlign: TextAlign.right, 
            textDirection: TextDirection.rtl, 
            decoration: InputDecoration(
              hintText: "ادخل اسمك بالكامل", 
              hintStyle: TextStyle(
                  color: Colors.grey, fontSize: 16.sp), 
              filled: true, 
              fillColor: Colors.grey[200], 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r), 
                borderSide: BorderSide.none, 
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w, vertical: 10.h), 
            ),
          )
        ],
      ),
    );
  }
}
