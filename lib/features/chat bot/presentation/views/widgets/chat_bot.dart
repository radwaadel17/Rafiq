import 'dart:convert';
import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/chat%20bot/domain/entity/message_entity.dart';
import 'package:app/features/chat%20bot/presentation/views/text_field_chat_bot.dart';
import 'package:app/features/chat%20bot/presentation/views/widgets/chat_bot_bubble.dart';
import 'package:app/features/chat%20bot/presentation/views/widgets/user_chat_bot_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final List<MessageEntity> messages = [];
  bool isTyping = false;

  Future<void> sendMessage() async {
    final String msg = textEditingController.text.trim();
    if (msg.isEmpty) return;

    textEditingController.clear();

    setState(() {
      messages.add(MessageEntity(isUser: true, message: msg));
      isTyping = true;
    });

    scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': msg}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botResponse = data['response'] ?? "❗ لم يتم الرد من الخادم.";
        setState(() {
          messages.add(MessageEntity(isUser: false, message: botResponse));
        });
      } else {
        setState(() {
          messages.add(MessageEntity(
            isUser: false,
            message: "❗ خطأ أثناء الاتصال بالسيرفر (${response.statusCode})",
          ));
        });
      }
    } catch (e) {
      setState(() {
        messages.add(MessageEntity(
          isUser: false,
          message: "❗ فشل الاتصال بالسيرفر:\n$e",
        ));
      });
    } finally {
      isTyping = false;
      scrollToBottom();
    }
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        height: context.screenHeight * 0.75,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length + (isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < messages.length) {
                    final messageEntity = messages[index];
                    return messageEntity.isUser
                        ? UserMessageChatBotBubble(msg: messageEntity.message)
                        : ChatBotBubble(msg: messageEntity.message);
                  } else {
                    return const ChatBotBubble(
                      msgWidget: TypingIndicator(),
                    );
                  }
                },
              ),
            ),
            TextFieldChatBot(
              onPressed: () async {
                await sendMessage();
              },
              textEditingController: textEditingController,
            )
          ],
        ),
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> dotOne;
  late Animation<double> dotTwo;
  late Animation<double> dotThree;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    dotOne = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.3, curve: Curves.easeInOut)),
    );
    dotTwo = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.2, 0.5, curve: Curves.easeInOut)),
    );
    dotThree = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(radius: 4, backgroundColor:colorApp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDot(dotOne),
        buildDot(dotTwo),
        buildDot(dotThree),
      ],
    );
  }
}