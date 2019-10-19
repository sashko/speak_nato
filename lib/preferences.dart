import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:speak_nato/alphabets.dart';

Future<String> getLanguage() async {
  var prefs = await SharedPreferences.getInstance();

  var tts = new FlutterTts();

  var alphabet = prefs.getString('alphabet');
  String language;
  bool isLangAvailable;

  if (alphabets[alphabet].containsKey(alphabet)) {
    language = alphabetlocale[alphabet];
  } else {
    language = "en-US";
  }

  isLangAvailable = await tts.isLanguageAvailable(language);
  if (isLangAvailable) {
    return language;
  } else {
    return null;
  }
}
