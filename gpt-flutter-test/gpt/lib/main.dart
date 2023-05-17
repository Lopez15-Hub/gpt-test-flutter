import 'package:flutter/material.dart';
import 'core/services/preferences/preferences_service.dart';
import 'gpt_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();

  runApp(const GptTest());
}
