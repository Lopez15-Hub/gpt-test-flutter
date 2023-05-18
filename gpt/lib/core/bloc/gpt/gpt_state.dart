part of 'gpt_cubit.dart';

abstract class GptState {}

class GptInitial extends GptState {
  final String response;
  GptInitial({this.response = ""});

  GptInitial copyWith({String? response}) {
    return GptInitial(
      response: response ?? this.response,
    );
  }
}

class GptResponse extends GptState {
  String response;
  GptResponse(this.response);
}

class GptAnswer extends GptState {
  String response;
  GptAnswer(this.response);
}

class ErrorResponse extends GptState {
  final String message;

  ErrorResponse({this.message = ""});

  ErrorResponse copyWith({String? message}) {
    return ErrorResponse(
      message: message ?? this.message,
    );
  }
}

