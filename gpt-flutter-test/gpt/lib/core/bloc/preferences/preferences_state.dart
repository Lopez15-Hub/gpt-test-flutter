part of 'preferences_cubit.dart';

abstract class PreferencesState {
  final String gptKey;

  PreferencesState(this.gptKey);
}

class PreferencesInitial extends PreferencesState {
  PreferencesInitial(super.gptKey);
}

class ChatGptKeyRetrieved extends PreferencesState {
  ChatGptKeyRetrieved(super.gptKey);
}

class StoredChatGptKey extends PreferencesState {
  StoredChatGptKey(super.gptKey);
}
