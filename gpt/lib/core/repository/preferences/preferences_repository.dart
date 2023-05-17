import 'package:gpt/core/services/services.dart';

///
/// Interacts with the app preferences
///
class PreferencesRepository {
  final PreferencesService service;

  /// 
  /// [service] service of preferences library.
  PreferencesRepository(this.service);

  ///
  /// Store the openAi Key in local storage.
  /// [value] openAi key value.
  setGptKey(String value) => service.setLocalString("gptKey", value);
  
  /// 
  /// Get the openAi Key from local storage.
  getGptKey() => service.getLocalString("gptKey");
}
