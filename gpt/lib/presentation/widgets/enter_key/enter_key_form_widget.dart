import 'package:flutter/material.dart';
import 'package:gpt/presentation/presentation.dart';

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
        child: TextFieldWidget( formCubit: formCubit));
  }
}
