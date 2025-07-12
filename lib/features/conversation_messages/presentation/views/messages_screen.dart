import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/messages/presentation/views/data/message_model.dart';
import 'package:app/features/messages/presentation/views/widgets/message_item.dart';
import 'package:app/features/messages/presentation/views/widgets/messages_header.dart';
import 'package:app/features/messages/presentation/views/widgets/messgae_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(84),
        child: MessagesHeader(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: ListView.separated(
                reverse: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 1,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "اليوم",
                          style: Styles.textstyle16,
                        ),
                      ),
                      const Gap(
                        16,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        reverse: true,
                        itemBuilder: (_, int messageIndex) {
                          return InkWell(
                            // onLongPress: () {
                            //   setState(() {
                            //     actionName = "delete";
                            //   });
                            //   onDeleteMessage(messagesForDate[messageIndex]);
                            // },
                            child: MessageItem(
                              isME: messageIndex == 1,
                              message: MessageModel(
                                type: "text",
                                message: "أهلاً وسهلاً أستاذ محمد! كيف حالك اليوم؟ كيف حال ابنك عمر؟",
                                time: '9 Pm',
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Gap(16),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Gap(16),
              ),
            ),
          ),
          const MessgeInput(),
        ],
      ),
    );
  }
}