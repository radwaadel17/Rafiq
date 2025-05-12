import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/text_arabic_with_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key, required this.text, this.onPressed, this.customColor,  this.check, this.borderRadius,
  });
  final String text;
  final void Function()? onPressed ;
  final Color? customColor;
  final bool? check ;
  final BorderRadius? borderRadius;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          backgroundColor:widget.customColor ?? colorApp,
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius == null ? BorderRadius.circular(5)  : widget.borderRadius!,
             side: widget.customColor != null 
              ? const BorderSide(color: colorApp, width: 2) 
              : BorderSide.none, 
            
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          
        ),
        child: widget.check == true ? const Center(child: CircularProgressIndicator(color: Colors.white),) :  TextArabicWithStyle(
            text: widget.text,
            textsyle:
                Styles.textstyle18.copyWith(color:widget.customColor != null? colorApp : Colors.white)));
  }
}
