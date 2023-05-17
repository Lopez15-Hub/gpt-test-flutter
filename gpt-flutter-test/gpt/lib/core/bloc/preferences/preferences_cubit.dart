import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpt/core/bloc/blocs.dart';
import 'package:gpt/core/repository/preferences/preferences_repository.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  final PreferencesRepository _repository;
  final GptFormCubit _formCubit;
  final NavigationCubit _navigationCubit;
  PreferencesCubit(this._repository, this._formCubit, this._navigationCubit)
      : super(PreferencesInitial(""));
  void storeGptKey(
      FormState formState, String value, NavigatorState navigator) {
    _formCubit.validate(formState);
    if (_formCubit.state is FormIsValid) {
      _repository.setGptKey(value.trim());
      _formCubit.reset(formState);
      _navigationCubit.goToChat(navigator);
    }
    emit(StoredChatGptKey(state.gptKey));
  }

  void retrieveGptKey() {
    _repository.getGptKey();
    emit(ChatGptKeyRetrieved(state.gptKey));
  }
}
