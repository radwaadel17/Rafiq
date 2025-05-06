import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMessageChatBotBubble extends StatelessWidget {
  const UserMessageChatBotBubble({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Flexible(
            child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: colorApp, borderRadius: BorderRadius.circular(5.r)),
          child: Text(
            msg ,
            style: Styles.textstyle14.copyWith(color: Colors.white),
          ),
        )),
      ),
    );
  }
}
