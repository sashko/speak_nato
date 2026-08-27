import 'package:speak_nato/alphabets.dart';

String phonetizeText(String str, String currentAlphabet) {
  var phoneticText = "";

  if (!alphabets.containsKey(currentAlphabet)) {
    currentAlphabet = "ICAO";
  }

  str = str.trim();

  List<String> alphabetByLength = alphabets[currentAlphabet]!.keys.toList(
    growable: false,
  );
  alphabetByLength.sort((a, b) => b.length.compareTo(a.length));

  for (var pos = 0; pos < str.length; pos++) {
    for (var i = 0; i < alphabetByLength.length; i++) {
      var pattern = alphabetByLength[i];
      if (pos + pattern.length > str.length) {
        continue;
      }

      if (pattern == str.toUpperCase().substring(pos, pos + pattern.length)) {
        phoneticText += "${alphabets[currentAlphabet]![pattern]!} ";
        pos += pattern.length - 1;
        break;
      }
    }
  }

  return phoneticText;
}
