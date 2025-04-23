import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key, required this.check, required this.onChanged,
    
  });
  final bool check ;
  final void Function(bool?) onChanged ; 
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          
          children: [
             Checkbox(
              value: widget.check,
              onChanged: widget.onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              side: const BorderSide(color: colorApp, width: 2),
              checkColor: Colors.white, 
              activeColor: colorApp, ),
              TextArabicWithStyle(
                text: 'اوافق على',
                textsyle: Styles.textstyle12.copyWith(fontSize: 14.sp)),
            TextArabicWithStyle(
                text: ' الشروط والأحكـام',
                textsyle: Styles.textstyle12
                    .copyWith(fontSize: 14.sp, color: colorApp)),
          
           
          ],
        )
      ],
    );
  }
}
