import 'package:flutter/material.dart';

import '../../../core/core.dart';

class EnterKeyForm extends StatelessWidget {
  const EnterKeyForm({
    super.key,
    required this.apiFormKey,
    required this.formCubit,
  });

  final GlobalKey<FormState> apiFormKey;
  final GptFormCubit formCubit;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: apiFormKey,
        child: TextFormField(
          validator: (value) => value!.isEmpty
              ? "You must provide a valid token to interact with GPT"
              : null,
          onChanged: (value) => formCubit.captureMessage(value),
          decoration: const InputDecoration(
            hintText: "Api Key",
            filled: true,
            counterStyle: TextStyle(color: Colors.green),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
          ),
        ));
  }
}
