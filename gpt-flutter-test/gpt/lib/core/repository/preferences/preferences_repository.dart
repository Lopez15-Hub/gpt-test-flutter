import 'package:gpt/core/services/services.dart';

class PreferencesRepository {
  final PreferencesService service;
  PreferencesRepository(this.service);

  setGptKey(String value) => service.setLocalString("gptKey", value);
  getGptKey() => service.getLocalString("gptKey");
}

// final repo = PreferencesRepository(PreferencesService());
