part of 'gpt_form_cubit.dart';

abstract class GptFormState {}

class GptFormInitial extends GptFormState {
  final String inputText;
  GptFormInitial({this.inputText = ""});
  copyWith(String? inputText) =>
      GptFormInitial(inputText: inputText ?? this.inputText);
}

class ReadMessage extends GptFormState {
  final String message;
  ReadMessage(this.message);
}

class FormIsValid extends GptFormState {}
