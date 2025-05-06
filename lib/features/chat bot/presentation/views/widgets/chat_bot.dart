import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/chat%20bot/domain/entity/message_entity.dart';
import 'package:app/features/chat%20bot/presentation/views/text_field_chat_bot.dart';
import 'package:app/features/chat%20bot/presentation/views/widgets/chat_bot_bubble.dart';
import 'package:app/features/chat%20bot/presentation/views/widgets/user_chat_bot_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController textEditingController = TextEditingController();
  static const apiKey = 'AIzaSyBAudXO0R842_9TanoHY432qKdeeQaf8po';
  final model = GenerativeModel(model: 'models/gemini-1.5-pro-001', apiKey: apiKey);
  final List<MessageEntity> messages = [];
  Future<void> sendMessage() async {
    final String msg = textEditingController.text;
    textEditingController.clear();
    setState(() {
      messages.add(MessageEntity(isUser: true, message: msg));
    });
    final content = [Content.text(msg)];
    final response = await model.generateContent(content);
    setState(() {
      messages.add(MessageEntity(isUser: false, message: response.text ?? ""));
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
                topRight: Radius.circular(30.r))),
        child: Expanded(
            child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context , index){
              final MessageEntity messageEntity = messages[index];
               if(messageEntity.isUser == true) {
                 return UserMessageChatBotBubble(msg: messageEntity.message);
               } else {
                 return ChatBotBubble(msg: messageEntity.message);
               } 
            }),),
            TextFieldChatBot(
              onPressed: () async{
                sendMessage();
             
              },
              textEditingController: textEditingController,
            )
          ],
        )),
      ),
    );
  }
}
