import 'package:flutter/material.dart';

class TextArabicWithStyle extends StatelessWidget {
  final String text;
  final TextStyle textsyle;
  final TextAlign? textAlign;
  const TextArabicWithStyle({
    super.key,
   this.textAlign,
    required this.text,
    required this.textsyle,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, 
    child: Text(
      text ,
      style: textsyle,
      textAlign: textAlign ?? TextAlign.right,
    ));
  }
}
