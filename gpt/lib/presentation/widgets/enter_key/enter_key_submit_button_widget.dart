import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.preferencesCubit,
    required this.apiFormKey,
  });

  final PreferencesCubit preferencesCubit;
  final GlobalKey<FormState> apiFormKey;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return BlocBuilder<PreferencesCubit, PreferencesState>(
      builder: (context, state) {
        if (state is StoredChatGptKeyFailed) {
          return Center(
            child: Text(
                "An ocurred error storing the key, please, try again later. Error: ${state.error}"),
          );
        }
        if (state is SavingData) {
          return const Center(
            child: CircularProgressIndicator(
                color: Colors.green,),
          );
        }
        return BlocBuilder<GptFormCubit, GptFormState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, right: 100, left: 100)),
                  onPressed: () => preferencesCubit.storeGptKey(
                      apiFormKey.currentState!,
                      state is ReadMessage ? state.message : "",
                      navigator),
                  child: const Text("Enter to chat")),
            );
          },
        );
      },
    );
  }
}
