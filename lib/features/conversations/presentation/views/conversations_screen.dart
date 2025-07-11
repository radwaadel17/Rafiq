import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/conversations/presentation/views/widgets/conversation_header.dart';
import 'package:app/features/conversations/presentation/views/widgets/conversation_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ConversationHeader(),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الرسائل",
                        style: Styles.textstyle16,
                      ),
                      const Gap(8),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (_, int index) {
                          return InkWell(
                            onTap: () {
                              context.pushNamed("messages");
                            },
                            child: const ConversationItem(),
                          );
                        },
                        separatorBuilder: (_, int index) {
                          return const Gap(20);
                        },
                        itemCount: 4,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
