import 'package:flutter/material.dart';
import 'core/services/preferences/preferences_service.dart';
import 'gpt_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();

  runApp(const GptTest());
}
