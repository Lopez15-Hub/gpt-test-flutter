import 'package:flutter/material.dart';
import 'package:gpt/core/bloc/blocs.dart';
import 'package:gpt/presentation/presentation.dart';

class ChatTextInput extends StatelessWidget {
  const ChatTextInput({
    super.key,
    required this.formCubit,
    required this.gptCubit, required this.chatCubit, required this.formState
  });

  final GptFormCubit formCubit;
  final GptCubit gptCubit;
  final ChatCubit chatCubit;
  final GlobalKey<FormState> formState;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
          validator: (value) => value!.trim().isEmpty
              ? "You must type any to interact with GPT"
              : null,
          maxLines: null,
          cursorColor: Colors.green,
          decoration:  InputDecoration(
            filled: true,
            suffixIcon: SendChatButton(
                chatCubit: chatCubit,
                formState: formState,
                formCubit: formCubit),
            hintText: "Type anything...",
            counterStyle: const TextStyle(color: Colors.green),
            focusColor: Colors.green,
            isCollapsed: true,
            contentPadding: const EdgeInsets.all(20),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
          ),
          onChanged: (value) => formCubit.captureMessage(value)),
    );
  }
}
