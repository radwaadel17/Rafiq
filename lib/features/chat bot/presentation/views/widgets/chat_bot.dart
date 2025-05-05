import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/chat%20bot/presentation/views/text_field_chat_bot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        height: context.screenHeight * 0.75,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r) , topRight: Radius.circular(30.r) )
        ),
        child: const Expanded(child: Column(
          children: [
          Spacer(),
          TextFieldChatBot()
          ],
        )),
      ),
    );
  }
}

