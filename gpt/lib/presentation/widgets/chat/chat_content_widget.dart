import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../widgets.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({
    super.key,
    required this.formCubit,
    required this.gptCubit,
  });

  final GptFormCubit formCubit;
  final GptCubit gptCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const ChatMessagesBox(text: "Type Someting..."),
        ChatForm(formCubit: formCubit, gptCubit: gptCubit),
      ],
    );
  }
}
