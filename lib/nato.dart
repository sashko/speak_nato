import 'package:speak_nato/alphabets.dart';

// Accented letters that are not part of the selected alphabet fold to their
// base letter, so Greek "ά" spells out as "Αστήρ" instead of passing through as
// a bare glyph. Folding is only a fallback: letters that the alphabet defines in
// their own right (Nordic Å/Ä/Ö/Æ/Ø, German Ä/Ö/Ü, Spanish Ñ) match exactly and
// never reach this table.
const Map<String, String> baseLetters = {
  "Ά": "Α",
  "Έ": "Ε",
  "Ή": "Η",
  "Ί": "Ι",
  "Ό": "Ο",
  "Ύ": "Υ",
  "Ώ": "Ω",
  "Ϊ": "Ι",
  "Ϋ": "Υ",
  "Á": "A",
  "À": "A",
  "Â": "A",
  "Ã": "A",
  "Ä": "A",
  "Å": "A",
  "Æ": "A",
  "Ç": "C",
  "É": "E",
  "È": "E",
  "Ê": "E",
  "Ë": "E",
  "Í": "I",
  "Ì": "I",
  "Î": "I",
  "Ï": "I",
  "Ñ": "N",
  "Ó": "O",
  "Ò": "O",
  "Ô": "O",
  "Õ": "O",
  "Ö": "O",
  "Ø": "O",
  "Ú": "U",
  "Ù": "U",
  "Û": "U",
  "Ü": "U",
  "Ý": "Y",
  "Ÿ": "Y",
};

String phonetizeText(String str, String currentAlphabet) {
  var phoneticText = "";

  if (!alphabets.containsKey(currentAlphabet)) {
    currentAlphabet = "ICAO";
  }

  str = str.trim();

  var alphabet = alphabets[currentAlphabet]!;
  var upperStr = str.toUpperCase();

  List<String> alphabetByLength = alphabet.keys.toList(growable: false);
  alphabetByLength.sort((a, b) => b.length.compareTo(a.length));

  for (var pos = 0; pos < str.length; pos++) {
    var matched = false;

    for (var i = 0; i < alphabetByLength.length; i++) {
      var pattern = alphabetByLength[i];
      if (pos + pattern.length > str.length) {
        continue;
      }

      if (pattern == upperStr.substring(pos, pos + pattern.length)) {
        phoneticText += "${alphabet[pattern]!} ";
        pos += pattern.length - 1;
        matched = true;
        break;
      }
    }

    if (!matched) {
      var base = baseLetters[upperStr[pos]];
      if (base != null && alphabet.containsKey(base)) {
        phoneticText += "${alphabet[base]!} ";
        matched = true;
      }
    }

    if (!matched) {
      phoneticText += "${str[pos]} ";
    }
  }

  return phoneticText;
}
