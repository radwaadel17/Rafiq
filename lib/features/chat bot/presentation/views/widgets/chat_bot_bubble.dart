import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBotBubble extends StatelessWidget {
  const ChatBotBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: [
            SizedBox(
                height: context.screenHeight * 0.08,
                child: Image.asset(Assets.images.chatAiLogo.path)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    'أهلا، كيف يمكنني مساعدتك؟',
                    style: Styles.textstyle14,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
