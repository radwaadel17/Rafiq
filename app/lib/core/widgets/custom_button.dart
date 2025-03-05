import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.onPressed, this.customColor,
  });
  final String text;
  final void Function()? onPressed ;
  final Color? customColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:customColor ?? colorApp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
             side: customColor != null 
              ? const BorderSide(color: colorApp, width: 2) 
              : BorderSide.none, 
            
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          
        ),
        child: TextArabicWithStyle(
            text: text,
            textsyle:
                Styles.textstyle18.copyWith(color:customColor != null? colorApp : Colors.white)));
  }
}
