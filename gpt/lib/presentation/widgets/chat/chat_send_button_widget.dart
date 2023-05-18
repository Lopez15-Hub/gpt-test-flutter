import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../widgets.dart';

class SendChatButton extends StatelessWidget {
  const SendChatButton({
    super.key,
    required this.chatCubit,
    required GlobalKey<FormState> formState,
    required this.formCubit,
  }) : _formState = formState;

  final ChatCubit chatCubit;
  final GlobalKey<FormState> _formState;
  final GptFormCubit formCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GptFormCubit, GptFormState>(
      builder: (context, state) {
        if (state is ReadMessage) {
          return IconButton(
              enableFeedback: true,
              style: IconButton.styleFrom(elevation: 10),
              onPressed: () => chatCubit.sendMessage(
                  ChatMessage(message: state.message, sender: Sender.user),
                  _formState.currentState!),
              icon: Icon(
                Icons.send,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey
                    : Colors.green,
              ));
        }
        return IconButton(
          onPressed: context.watch<ChatCubit>().state is GptIsWriting
              ? null
              : () => formCubit.validate(_formState.currentState!),
          icon: Icon(context.watch<ChatCubit>().state is GptIsWriting
              ? Icons.stop
              : Icons.send,),
          style: IconButton.styleFrom(
            elevation: 4,
            backgroundColor: Colors.grey,
          ),
          color: context.watch<ChatCubit>().state is GptIsWriting
              ? Colors.grey
              : Theme.of(context).brightness == Brightness.light
                  ? Colors.green
                  : Colors.grey,
        );
      },
    );
  }
}
