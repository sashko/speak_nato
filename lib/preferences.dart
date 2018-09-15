import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_tts/flutter_tts.dart';

Future<String> getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  FlutterTts tts = new FlutterTts();

  String alphabet = prefs.getString('alphabet');
  String language;
  bool isLangAvailable;

  switch (alphabet) {
    case "ICAO":
      language = "en-US";
      break;
    case "Swedish":
      language = "sv-SE";
      break;
    case "Ukrainian":
      language = "uk-UA";
      break;
    default:
      language = "en-US";
  }

  isLangAvailable = await tts.isLanguageAvailable(language);
  if (isLangAvailable) {
    return language;
  } else {
    return null;
  }
}