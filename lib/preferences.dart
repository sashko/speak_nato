import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';

import 'package:tts/tts.dart';

Future<String> getLanguage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String _alphabet = prefs.getString('alphabet');
  String language;
  bool isLangAvailable;

  switch (_alphabet) {
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

  isLangAvailable = await Tts.isLanguageAvailable(language);
  if (isLangAvailable) {
    return language;
  } else {
    return null;
  }
}
