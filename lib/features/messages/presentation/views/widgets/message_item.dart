// ignore_for_file: library_private_types_in_public_api

import 'package:app/core/utlis/constants.dart';
import 'package:app/features/messages/data/message_model.dart';
import 'package:app/features/messages/presentation/views/widgets/chat_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MessageItem extends StatefulWidget {
  final bool? isME;
  final MessageModel? message;
  const MessageItem({super.key, this.isME, this.message});

  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          //  Translations.of(context)!.currentLanguage == "ar"
          //     ?
          !widget.isME! ? Alignment.topRight : Alignment.topLeft,
      // :
      // !widget.isME!
      //     ? Alignment.topLeft
      //     : Alignment.topRight,
      child: IntrinsicWidth(
        child: Directionality(
          textDirection:
              // Translations.of(context)!.currentLanguage == "ar"
              //     ?
              !widget.isME! ? TextDirection.rtl : TextDirection.ltr,
          // : !widget.isME!
          //     ? TextDirection.ltr
          //     : TextDirection.rtl,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: (widget.message!.type == "photo" || widget.message!.type == "video")
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: (widget.message!.type == "photo" || widget.message!.type == "video")
                      ? Colors.transparent
                      : !widget.isME!
                          ? colorApp
                          : const Color(0xffE4E6F0),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(8.0),
                    topRight: !widget.isME! ? const Radius.circular(8.0) : const Radius.circular(8.0),
                    bottomLeft:
                        //  Translations.of(context)!.currentLanguage == "en"
                        //     ? !widget.isME!
                        //         ? Radius.circular(0.0)
                        //         : Radius.circular(15.0)
                        //     :
                        !widget.isME! ? const Radius.circular(8.0) : const Radius.circular(0.0),
                    bottomRight:
                        // Translations.of(context)!.currentLanguage == "en"
                        //     ? !widget.isME!
                        //         ? Radius.circular(15.0)
                        //         : Radius.circular(0.0)
                        //     :
                        !widget.isME! ? const Radius.circular(0.0) : const Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: widget.message!.type == "photo" ||
                          widget.message!.type == "video" ||
                          widget.message!.type == "audio"
                      ? EdgeInsets.zero
                      : const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                  child: renderTypesOfMessages(),
                ),
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderTypesOfMessages() {
    if (widget.message!.type == "text") {
      return ChatTextWidget(
        message: widget.message!,
        isME: widget.isME,
      );
    }

    return const SizedBox();
  }
}
