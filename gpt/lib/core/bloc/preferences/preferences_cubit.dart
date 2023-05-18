import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpt/core/bloc/blocs.dart';
import 'package:gpt/core/repository/preferences/preferences_repository.dart';

part 'preferences_state.dart';

///
/// Cubit for manage the Preferences storage states.
///

class PreferencesCubit extends Cubit<PreferencesState> {
  final PreferencesRepository _repository;
  final GptFormCubit _formCubit;
  final NavigationCubit _navigationCubit;

  PreferencesCubit(this._repository, this._formCubit, this._navigationCubit)
      : super(PreferencesInitial(""));

  /// Stores the OpenAi key that comes from the form.
  ///
  ///  [formState] state of form.
  ///
  /// [value] openAI Key.
  ///
  /// [navigator] State of navigator.
  /// Emit a StoredChatGptKey when the key was stored or StoredChatGptKeyFailed if exists.
  void storeGptKey(FormState formState, String value, BuildContext context) {
    emit(SavingData());
    try {
      _formCubit.validate(formState);
      if (_formCubit.state is FormIsValid) {
        _repository.setGptKey(value.trim());
        _formCubit.reset(formState);
        _navigationCubit.goToChat(context);
      }
      emit(StoredChatGptKey(state.gptKey));
    } catch (error) {
      emit(StoredChatGptKeyFailed(error.toString()));
    }
  }

  /// Retrieve the OpenAi key from the local storage.
  ///
  /// [context] context of EnterKeyView
  ///
  /// Emit a ChatGptKeyRetrieved when the key was retrieved.
  void retrieveGptKey(BuildContext context) {
    _repository.existsKey().then((existsKey) {
      if (existsKey) {
        emit(ChatGptKeyRetrieved(state.gptKey));
        _navigationCubit.goToChat(context);
      } else {
        emit(PreferencesInitial(""));
      }
    }).catchError((error) {
      emit(ChatGptKeyRetrievedFailed(error.toString()));
    });
  }
}
