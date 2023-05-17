import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../presentation/widgets/widgets.dart';
import '../../types/types.dart';
import '../blocs.dart';

part 'chat_state.dart';

//

class ChatCubit extends Cubit<ChatState> {
  final GptFormCubit _formCubit;
  final GptCubit _gptCubit;
  ChatCubit(this._formCubit, this._gptCubit) : super(ChatInitial([]));

  void insertMessage(ChatMessage newMessage) {
    state.messages.insert(0, newMessage);
    emit(ChatInitial(state.messages));
  }

  void cancelQuestion() {
    _gptCubit.cancelQuestion();
  }

  void sendMessage(ChatMessage newMessage, FormState formState) async {
    _formCubit.validate(formState);

    if (_formCubit.state is FormIsValid) {
      _formCubit.reset(formState);

      insertMessage(newMessage);

      gptIsWriting();
      if (_gptCubit.state is RequestCancel) {
        emit(state);
      }
      final result = await _gptCubit.makeQuestion(newMessage.message, this);

      insertMessage(ChatMessage(message: result, sender: Sender.chatGPT));

      gptFinishedWriting();

      _gptCubit.emit(GptResponse(result));

      messageSent();
    }
  }

  void gptIsWriting() {
    emit(GptIsWriting(state.messages));
  }

  void gptFinishedWriting() {
    emit(ChatInitial(state.messages));
  }

  void messageSent() {
    emit(MessageSent(state.messages));
  }
}
