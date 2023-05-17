import 'package:flutter/material.dart';
import '../../../core/types/types.dart';
import '../widgets.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final Sender sender;
  final bool gptIsWriting;
  const ChatMessage(
      {super.key,
      required this.message,
      required this.sender,
      this.gptIsWriting = false});

  @override
  Widget build(BuildContext context) {
    return sender == Sender.chatGPT
        ? ChatGptMessage(
            gptIsWriting: gptIsWriting,
            message: message,
          )
        : ChatPersonMessage(
            message: message,
          );
  }
}
