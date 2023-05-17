import 'package:bloc/bloc.dart';
import 'package:gpt/core/repository/gpt/gpt_repository.dart';

import '../blocs.dart';
part 'gpt_state.dart';

class GptCubit extends Cubit<GptState> {
  final GptRepository _repository;
  GptCubit({required GptRepository repository})
      : _repository = repository,
        super(GptInitial());

  Future<String> makeQuestion(String question, ChatCubit chatCubit) async {
    try {
      String result = await _repository.makeQuestion(question, 200);
      return result;
    } catch (error) {
      emit(ErrorResponse(message: error.toString()));
      return "$error";
    }
  }

  void cancelQuestion() {
    _repository.cancelQuestion();
    emit(RequestCancel());
  }
}
