/*
 * Code that performs translation to phonetic alphabet
*/
import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/alphabets.dart';

String alphabet = "";

Future _getAlphabet() async {
  var prefs = await SharedPreferences.getInstance();

  alphabet = prefs.getString('alphabet');
}

String phonetizeText(String _str, [String _alphabetTest]) {
  var _phoneticText = "";
  
  if (_alphabetTest != null) {
    alphabet = _alphabetTest;
  } else {
    _getAlphabet();
  }
  
  if (!alphabets.containsKey(alphabet)) {
    alphabet = "ICAO" ;
  }

  _str = _str.trim();
  for (var i = 0; i < _str.length; i++) {
    if (alphabets[alphabet].containsKey(_str[i].toUpperCase())) {
      _phoneticText += alphabets[alphabet][_str[i].toUpperCase()] + " ";
    }
  }
  
  return _phoneticText;
}
