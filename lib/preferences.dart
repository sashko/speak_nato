import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/alphabets.dart';

Future<String?> getLanguage(FlutterTts tts) async {
  var prefs = await SharedPreferences.getInstance();
  var alphabet = prefs.getString('alphabet');

  String language;
  if (alphabetlocale.containsKey(alphabet)) {
    language = alphabetlocale[alphabet].toString();
  } else {
    language = "en-US";
  }

  bool isLangAvailable = await tts.isLanguageAvailable(language) as bool;
  return isLangAvailable ? language : "";
}
