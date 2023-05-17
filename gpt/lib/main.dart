import 'package:flutter/material.dart';
import 'core/services/preferences/preferences_service.dart';
import 'gpt_test.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  /// For avoid conflicts i declare the preferences,
  /// before the apps starts.
  await PreferencesService.init();

  runApp(const GptTest());
}
