import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/messages/presentation/views/widgets/list_view_of_messages.dart';
import 'package:app/features/messages/presentation/views/widgets/messages_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageViewBody extends StatelessWidget {
  const MessageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MessagesHeader(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Text(
            'الرسائل',
            style: Styles.textstyle16,
          ),
        ),
        const ListViewOfMessages()
      ],
    );
  }
}
