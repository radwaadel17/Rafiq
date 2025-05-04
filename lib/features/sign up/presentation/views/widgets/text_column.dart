import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key, required this.txt, required this.txt2,
  });
   final String txt ;
   final String txt2; 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          txt,
          style: Styles.textstyle18,
        ),
        SizedBox(
            width: context.screenWidth * 0.80,
            child: Text(
              txt2,
              style: Styles.textstyle12,
              textAlign: TextAlign.center,
            )),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }
}
