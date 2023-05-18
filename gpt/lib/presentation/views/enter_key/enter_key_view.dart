import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpt/core/bloc/blocs.dart';

import '../../widgets/app/custom_appbar_widget.dart';
import '../../widgets/widgets.dart';

class EnterKey extends StatelessWidget {
  const EnterKey({super.key});

  @override
  Widget build(BuildContext context) {
    final formCubit = BlocProvider.of<GptFormCubit>(context);
    final apiFormKey = GlobalKey<FormState>();
    final preferencesCubit = BlocProvider.of<PreferencesCubit>(context);
    final navigatorCubit = BlocProvider.of<NavigationCubit>(context);
    final navigator = Navigator.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbar(
        appTitle: "Enter Api Key",
      ),
      body: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          if (state.gptKey.isNotEmpty) {
            navigatorCubit.goToChat(navigator);
          }
          return FadeIn(
            animate: true,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/chat_gpt_icon.jpg",
                    height: 200,
                    width: 200,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Insert you OpenAi Key Below",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  EnterKeyForm(apiFormKey: apiFormKey, formCubit: formCubit),
                  SubmitButton(
                      preferencesCubit: preferencesCubit,
                      apiFormKey: apiFormKey)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
