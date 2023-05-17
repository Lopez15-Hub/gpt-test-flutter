import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/blocs.dart';
import '../../../core/types/chat/sender_type.dart';
import 'chat_message_widget.dart';

class ChatMessagesList extends StatelessWidget {
  const ChatMessagesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
          reverse: true,
          itemBuilder: ((context, index) {
            if (index == 0 && state is GptIsWriting && state.isWriting) {
              return const ChatMessage(
                message: "GPT is writing..",
                sender: Sender.chatGPT,
                gptIsWriting: true,
              );
            }
            final messageIndex = index - (state is GptIsWriting ? 1 : 0);
            return state.messages[messageIndex];
          }),
          itemCount: state is GptIsWriting && state.isWriting
              ? state.messages.length + 1
              : state.messages.length,
        ));
      },
    );
  }
}
