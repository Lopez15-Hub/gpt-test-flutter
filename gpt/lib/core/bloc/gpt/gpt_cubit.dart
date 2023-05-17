import 'package:bloc/bloc.dart';
import 'package:gpt/core/repository/gpt/gpt_repository.dart';

import '../blocs.dart';
part 'gpt_state.dart';

///
/// Cubit for manage the states of AI.
///

class GptCubit extends Cubit<GptState> {
  final GptRepository _repository;

  GptCubit({required GptRepository repository})
      : _repository = repository,
        super(GptInitial());

  /// Make a question and get the AI response.
  ///
  /// [question] The question of user.
  ///
  /// [chatCubit] state managment of chat.
  ///
  /// returns the response of AI or emit a ErroResponse state if exists.
  Future<String> makeQuestion(String question, ChatCubit chatCubit) async {
    try {
      String result = await _repository.makeQuestion(question, 200);
      return result;
    } catch (error) {
      emit(ErrorResponse(message: error.toString()));
      return "$error";
    }
  }
}
