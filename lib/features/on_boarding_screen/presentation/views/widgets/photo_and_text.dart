import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class PhotoAndText extends StatelessWidget {
  const PhotoAndText({super.key, required this.text, required this.textStyle, required this.image, required this.onTap});
  final String text;
  final TextStyle textStyle;
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.02,),
          SizedBox(
            height: context.screenHeight  * 0.2,
            child: Image.asset(image)),
           SizedBox(height: context.screenHeight * 0.02,),
           TextArabicWithStyle(text: text, textsyle:textStyle),
         ],
      ),
    );
  }
}


