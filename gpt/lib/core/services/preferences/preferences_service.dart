import 'package:shared_preferences/shared_preferences.dart';

///
/// Service that interacts with the shared preferences  library.
/// I used static methods for get the preferences without an instance of this.
class PreferencesService {
  static late SharedPreferences _prefs;

  ///Initialize the shared preference service
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  ///Generic method for store a string in local storage.
  ///
  /// [keyName] name of string.
  ///
  /// [value] value of string.
  void setLocalString(String keyName, String value) =>
      _prefs.setString(keyName, value);

  ///Generic method for get a string from local storage.
  ///
  /// [keyName] name of string.
  String? getLocalString(String keyName) => _prefs.getString(keyName)!;
  bool existsString(String keyName) => _prefs.containsKey(keyName);
}
