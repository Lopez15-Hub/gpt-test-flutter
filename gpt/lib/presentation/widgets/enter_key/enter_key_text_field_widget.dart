import 'package:flutter/material.dart';

import '../../../core/core.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.formCubit,
  });

  final GptFormCubit formCubit;

  @override
  Widget build(BuildContext context) {
    final RegExp regExp =  RegExp(r'^sk-[A-Za-z0-9]{30,}$');

    return TextFormField(
      validator: (value) => value!.isEmpty
          ? "The field cannot be empty."
          : !regExp.hasMatch(value.trim())
              ? "You must provide a valid token to interact with GPT"
              : null,
      onChanged: (value) => formCubit.captureMessage(value),
      decoration: const InputDecoration(
        hintText: "Api Key",
        filled: true,
        counterStyle: TextStyle(color: Colors.green),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      ),
    );
  }
}
