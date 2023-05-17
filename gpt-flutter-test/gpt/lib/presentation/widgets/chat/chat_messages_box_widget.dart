import 'package:flutter/material.dart';
import 'chat_messages_list.dart';

class ChatMessagesBox extends StatelessWidget {
  final String text;
  const ChatMessagesBox({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return const ChatMessagesList();
  }
}
