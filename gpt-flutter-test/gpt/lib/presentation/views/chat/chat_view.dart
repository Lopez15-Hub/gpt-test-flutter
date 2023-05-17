import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/blocs.dart';
import '../../widgets/app/custom_appbar_widget.dart';
import '../../widgets/chat/chat_form_widget.dart';
import '../../widgets/chat/chat_messages_box_widget.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final gptCubit = BlocProvider.of<GptCubit>(context);
    final formCubit = BlocProvider.of<GptFormCubit>(context);
    return Scaffold(
      appBar: const CustomAppbar(
        appTitle: "Chat GPT Test",
      ),
      body: FadeIn(
        animate: true,
        child: BlocBuilder<GptCubit, GptState>(
        builder: (_, state) {
          if (state is ErrorResponse) return Center(child: Text(state.message));
          if (state is GptResponse) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChatMessagesBox(text: state.response),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ChatForm(formCubit: formCubit, gptCubit: gptCubit),
                    ],
                  )
                ],
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ChatMessagesBox(text: "Type Someting..."),
              ChatForm(formCubit: formCubit, gptCubit: gptCubit),
            ],
          );
        },
      )),
    );
  }
}
