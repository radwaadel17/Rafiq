import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/messages/data/message_model.dart';
import 'package:flutter/material.dart';

class ChatTextWidget extends StatelessWidget {
  const ChatTextWidget({
    super.key,
    required this.message,
    this.isME,
  });

  final MessageModel message;
  final bool? isME;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          //  Translations.of(context)!.currentLanguage == "en"
          //     ? !isME!
          //         ? CrossAxisAlignment.end
          //         : CrossAxisAlignment.start
          //     :
          !isME! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                message.message!,
                style: Styles.textstyle16.copyWith(
                  color: !isME! ? Colors.white : null,
                ),
              ),
            ),
          ),
        ),
        // Gap(5),
        // Text(
        //   message.time!,
        //   textDirection: TextDirection.ltr,
        //   style: Theme.of(context).textTheme.labelMedium!.copyWith(
        //         fontSize: 14,
        //       ),
        // ),
      ],
    );
  }
}
