
import 'package:app/features/messages/presentation/views/widgets/user_message.dart';
import 'package:flutter/material.dart';

class ListViewOfMessages extends StatelessWidget {
  const ListViewOfMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, cnt) {
            return const UserMessage();
          }),
    );
  }
}
