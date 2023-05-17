import 'package:flutter/material.dart';
import 'package:gpt/core/bloc/blocs.dart';

class ChatTextInput extends StatelessWidget {
  const ChatTextInput({
    super.key,
    required this.formCubit,
  });

  final GptFormCubit formCubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
          validator: (value) => value!.trim().isEmpty
              ? "You must type any to interact with GPT"
              : null,
            maxLines: null,
          decoration: const InputDecoration(
            filled: true,
          
            hintText: "Type anything...",
            counterStyle: TextStyle(color: Colors.green),
            focusColor: Colors.green,
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          ),
          onChanged: (value) => formCubit.captureMessage(value)),
    );
  }
}
