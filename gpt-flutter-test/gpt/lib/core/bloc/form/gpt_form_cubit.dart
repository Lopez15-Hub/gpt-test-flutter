import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'gpt_form_state.dart';

class GptFormCubit extends Cubit<GptFormState> {
  GptFormCubit() : super(GptFormInitial());

  captureMessage(String message) {
    emit(ReadMessage(message));
  }

  void validate(FormState formState) {
    if (formState.validate()) {
      emit(FormIsValid());
    }
  }

  void reset(FormState formState) {
    formState.reset();
    emit(GptFormInitial());
  }
}
