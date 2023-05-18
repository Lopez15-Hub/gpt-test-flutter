import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'gpt_form_state.dart';


// Cubit used for manage form states.

class GptFormCubit extends Cubit<GptFormState> {
  GptFormCubit() : super(GptFormInitial());

  /// Capture a value from input.
  ///
  ///[message] the text of input.
  ///
  /// Emit a ReadMessage state with the value.
  captureMessage(String message) {
    emit(ReadMessage(message));
  }
  /// Validate a form.
  ///
  ///[formState] state of form.
  ///
  /// Emit a FormIsValid state.
  void validate(FormState formState) {
    if (formState.validate()) {
      emit(FormIsValid());
    }
  }
  /// Reset form.
  ///
  ///[formState] state of form.
  ///
  /// Emit a GptFormInitial state with the initial values.
  void reset(FormState formState) {
    formState.reset();
    emit(GptFormInitial());
  }
}
