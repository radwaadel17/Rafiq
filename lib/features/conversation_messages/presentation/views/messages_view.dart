import 'package:app/features/messages/presentation/views/widgets/messages_view_body.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MessageViewBody(),
    );
  }
}