import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/blocs.dart';
import '../widgets.dart';

class ChatForm extends StatelessWidget {
  ChatForm({
    super.key,
    required this.formCubit,
    required this.gptCubit,
  });

  final GptFormCubit formCubit;
  final GptCubit gptCubit;
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);
    return Form(
      key: _formState,
      child: Row(
        children: [
          ChatTextInput(
            gptCubit: gptCubit,
            chatCubit: chatCubit,
            formCubit: formCubit,
            formState: _formState,
          ),
        ],
      ),
    );
  }
}
