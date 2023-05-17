import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static late SharedPreferences _prefs;
  static String _gptKey = "";

  static Future init() async => _prefs = await SharedPreferences.getInstance();
  static String get gptKey => _prefs.getString("gpt_key") ?? _gptKey;

  void setLocalString(String keyName, String value) =>
      _prefs.setString(keyName, value);
  String getLocalString(String keyName) => _prefs.getString(keyName)!;

  static Future<String> storeInPreferences({
    required String gptKey,
  }) async {
    try {
      PreferencesService.gptKey = gptKey.toString().trim();

      return "preferences_stored";
    } catch (error) {
      return throw Exception(error);
    }
  }

  static set gptKey(String gptKey) {
    _gptKey = gptKey;
    _prefs.setString("gpt_key", gptKey);
  }

  static getPreferences() {
    return {
      "gpt_key": _prefs.get("gpt_key"),
    };
  }

  static String cleanPreferences() {
    gptKey = 'null'.trim();
    return "preferences_cleaned";
  }
}
