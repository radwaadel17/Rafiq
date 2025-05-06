import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldChatBot extends StatelessWidget {
  const TextFieldChatBot({
    super.key, required this.textEditingController, this.onPressed, 
  });
  final TextEditingController textEditingController ;
  final Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        
        filled: true ,
        fillColor: Colors.white,
        hintText: 'اكتب رسالتك هنا..',
        suffixIcon: GestureDetector(
          onTap: onPressed ,
          child: SizedBox(
            height: 20.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Image.asset(Assets.images.sendIcon.path , fit: BoxFit.contain,),
            )),
        ),
          suffixIconConstraints: const BoxConstraints(
            maxHeight:30,
            minHeight: 2,
          ),
          hintStyle: Styles.textstyle14.copyWith(color: colorApp.withOpacity(0.74)),
      ),
    );
  }
}
