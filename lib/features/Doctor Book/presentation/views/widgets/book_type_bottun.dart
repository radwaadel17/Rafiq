import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookTypeButton extends StatefulWidget {
  const BookTypeButton({super.key, required this.txt, this.onPressed, this.isSelected});
  final String txt;
  final void Function()? onPressed;
  final bool? isSelected ;

  @override
  State<BookTypeButton> createState() => _BookTypeButtonState();
}

class _BookTypeButtonState extends State<BookTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor:  widget.isSelected == true? const Color(0xff49B04D) : const Color(0xffE4E6F0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            widget.txt,
            style: Styles.textstyle18.copyWith(color: widget.isSelected == true? Colors.white : textFieldColor),
          )),
    ));
  }
}
