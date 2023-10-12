/*
 * Code that performs translation to phonetic alphabet
*/
import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/alphabets.dart';

String? alphabet = "";

Future _getAlphabet() async {
  var prefs = await SharedPreferences.getInstance();

  alphabet = prefs.getString('alphabet');
}

String phonetizeText(String _str, [String? _alphabetTest]) {
  var _phoneticText = "";

  if (_alphabetTest != null) {
    alphabet = _alphabetTest;
  } else {
    _getAlphabet();
  }

  if (!alphabets.containsKey(alphabet)) {
    alphabet = "ICAO";
  }

  _str = _str.trim();

  List alphabetbylength = alphabets[alphabet]!.keys.toList(growable: false);
  alphabetbylength.sort((a, b) => (b.length.compareTo(a.length) as int));

  for (var pos = 0; pos < _str.length; pos++) {
    for (var i = 0; i < alphabetbylength.length; i++) {
      var pattern = alphabetbylength[i];
      if (pos + (pattern.length as int) > _str.length) {
        continue;
      }

      if (pattern == _str.toUpperCase().substring(pos, pos + (pattern.length as int))) {
        _phoneticText += alphabets[alphabet]![pattern] !+ " ";
        pos += (pattern.length as int) - 1;
        break;
      }
    }
  }

  return _phoneticText;
}
