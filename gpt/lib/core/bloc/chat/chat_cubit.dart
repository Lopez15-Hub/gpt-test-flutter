import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../presentation/widgets/widgets.dart';
import '../../types/types.dart';
import '../blocs.dart';

part 'chat_state.dart';

///
/// ChatCubit manage the chat states.
///

class ChatCubit extends Cubit<ChatState> {
  final GptFormCubit _formCubit;
  final GptCubit _gptCubit;
  ChatCubit(this._formCubit, this._gptCubit) : super(ChatInitial([]));

  /// Insert a new message widget in the chat context.
  ///
  /// [newMessage] widget that is displayed in the chat.
  ///
  /// Emit a ChatInitial state with the new list of messages.
  ///
  void insertMessage(ChatMessage newMessage) {
    state.messages.insert(0, newMessage);
    emit(ChatInitial(state.messages));
  }

  /// Sends a new message from user side.
  ///
  /// [newMessage] widget that is displayed in the chat.
  ///
  /// [formState] State of chatForm.
  ///
  /// Emit a GptResponse state with the response from AI.
  ///
  void sendMessage(ChatMessage newMessage, FormState formState) async {
    _formCubit.validate(formState);

    if (_formCubit.state is FormIsValid) {
      _formCubit.reset(formState);

      insertMessage(newMessage);

      gptIsWriting();

      final result = await _gptCubit.makeQuestion(newMessage.message, this);

      insertMessage(ChatMessage(message: result, sender: Sender.chatGPT));

      gptFinishedWriting();

      _gptCubit.emit(GptResponse(result));

      messageSent();
    }
  }

  /// Alert user that GPT is writing.
  ///
  /// Emit a GptIsWriting state with the messages as standard value.

  void gptIsWriting() {
    emit(GptIsWriting(state.messages));
  }

  /// Alert user that GPT isn't writing.
  ///
  /// Emit a ChatInitial state with the new messages list.

  void gptFinishedWriting() {
    emit(ChatInitial(state.messages));
  }

  /// Emit a state for send a new message for both sides.
  ///
  /// Emit a MessageSent state with the messages as standard value.

  void messageSent() {
    emit(MessageSent(state.messages));
  }
}
