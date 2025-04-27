
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookTypeButton extends StatelessWidget {
  const BookTypeButton({super.key, required this.txt});
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextButton(onPressed: (){},
      
       style: TextButton.styleFrom(
        backgroundColor: const Color(0xffE4E6F0),
        shape : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
                
            ),
       ),
       child: Text(txt , style: Styles.textstyle18.copyWith(color: textFieldColor), )),
    ));
  }
}