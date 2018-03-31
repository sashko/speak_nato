/*
 * Code that performs translation to phonetic alphabet
*/
import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';

String alphabet = "";

Future _getAlphabet() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  alphabet = prefs.getString('alphabet');
}

String phonetizeText(String _str, [String _alphabetTest]) {
  if (_alphabetTest != null) {
    alphabet = _alphabetTest;
  } else {
    _getAlphabet();
  }

  switch (alphabet) {
    case "ICAO":
      return convertToICAO(_str);
    case "Swedish":
      return convertToSwedish(_str);
    case "Ukrainian":
      return convertToUkrainian(_str);
    default:
      return "";
  }
}

String convertToSwedish(String _str) {
  String _phoneticText = "";

  _str = _str.trim();

  for (int i = 0; i < _str.length; i++) {
    switch (_str[i]) {
      case "a":
      case "A":
        _phoneticText += "Adam ";
        break;
      case "b":
      case "B":
        _phoneticText += "Bertil ";
        break;
      case "c":
      case "C":
        _phoneticText += "Caesar ";
        break;
      case "d":
      case "D":
        _phoneticText += "David ";
        break;
      case "e":
      case "E":
        _phoneticText += "Erik ";
        break;
      case "f":
      case "F":
        _phoneticText += "Filip ";
        break;
      case "g":
      case "G":
        _phoneticText += "Gustav ";
        break;
      case "h":
      case "H":
        _phoneticText += "Helge ";
        break;
      case "i":
      case "I":
        _phoneticText += "Ivar ";
        break;
      case "j":
      case "J":
        _phoneticText += "Johan ";
        break;
      case "k":
      case "K":
        _phoneticText += "Kalle ";
        break;
      case "l":
      case "L":
        _phoneticText += "Ludvig ";
        break;
      case "m":
      case "M":
        _phoneticText += "Martin ";
        break;
      case "n":
      case "N":
        _phoneticText += "Niklas ";
        break;
      case "o":
      case "O":
        _phoneticText += "Olof ";
        break;
      case "p":
      case "P":
        _phoneticText += "Petter ";
        break;
      case "q":
      case "Q":
        _phoneticText += "Qvintus ";
        break;
      case "r":
      case "R":
        _phoneticText += "Rudolf ";
        break;
      case "s":
      case "S":
        _phoneticText += "Sigurd ";
        break;
      case "t":
      case "T":
        _phoneticText += "Tore ";
        break;
      case "u":
      case "U":
        _phoneticText += "Urban ";
        break;
      case "v":
      case "V":
        _phoneticText += "Viktor ";
        break;
      case "w":
      case "W":
        _phoneticText += "Wilhelm ";
        break;
      case "x":
      case "X":
        _phoneticText += "Xerxes ";
        break;
      case "y":
      case "Y":
        _phoneticText += "Yngve ";
        break;
      case "Å":
      case "å":
        _phoneticText += "Åke ";
        break;
      case "Ä":
      case "ä":
        _phoneticText += "Ärlig ";
        break;
      case "Ö":
      case "ö":
        _phoneticText += "Östen ";
        break;
      case "z":
      case "Z":
        _phoneticText += "Zäta ";
        break;
      case "0":
        _phoneticText += "Nolla ";
        break;
      case "1":
        _phoneticText += "Etta ";
        break;
      case "2":
        _phoneticText += "Tvåa ";
        break;
      case "3":
        _phoneticText += "Trea ";
        break;
      case "4":
        _phoneticText += "Fyra ";
        break;
      case "5":
        _phoneticText += "Femma ";
        break;
      case "6":
        _phoneticText += "Sexa ";
        break;
      case "7":
        _phoneticText += "Sju ";
        break;
      case "8":
        _phoneticText += "Åtta ";
        break;
      case "9":
        _phoneticText += "Nia ";
        break;
      case " ":
        _phoneticText += "Mellanslag ";
        break;
    }
  }

  return _phoneticText;
}

String convertToICAO(String _str) {
  String _phoneticText = "";

  _str = _str.trim();

  for (int i = 0; i < _str.length; i++) {
    switch (_str[i]) {
      case "a":
      case "A":
        _phoneticText += "Alpha ";
        break;
      case "b":
      case "B":
        _phoneticText += "Bravo ";
        break;
      case "c":
      case "C":
        _phoneticText += "Charlie ";
        break;
      case "d":
      case "D":
        _phoneticText += "Delta ";
        break;
      case "e":
      case "E":
        _phoneticText += "Echo ";
        break;
      case "f":
      case "F":
        _phoneticText += "Foxtrot ";
        break;
      case "g":
      case "G":
        _phoneticText += "Golf ";
        break;
      case "h":
      case "H":
        _phoneticText += "Hotel ";
        break;
      case "i":
      case "I":
        _phoneticText += "India ";
        break;
      case "j":
      case "J":
        _phoneticText += "Juliett ";
        break;
      case "k":
      case "K":
        _phoneticText += "Kilo ";
        break;
      case "l":
      case "L":
        _phoneticText += "Lima ";
        break;
      case "m":
      case "M":
        _phoneticText += "Mike ";
        break;
      case "n":
      case "N":
        _phoneticText += "November ";
        break;
      case "o":
      case "O":
        _phoneticText += "Oscar ";
        break;
      case "p":
      case "P":
        _phoneticText += "Papa ";
        break;
      case "q":
      case "Q":
        _phoneticText += "Quebec ";
        break;
      case "r":
      case "R":
        _phoneticText += "Romeo ";
        break;
      case "s":
      case "S":
        _phoneticText += "Sierra ";
        break;
      case "t":
      case "T":
        _phoneticText += "Tango ";
        break;
      case "u":
      case "U":
        _phoneticText += "Uniform ";
        break;
      case "v":
      case "V":
        _phoneticText += "Victor ";
        break;
      case "w":
      case "W":
        _phoneticText += "Whiskey ";
        break;
      case "x":
      case "X":
        _phoneticText += "Xray ";
        break;
      case "y":
      case "Y":
        _phoneticText += "Yankee ";
        break;
      case "z":
      case "Z":
        _phoneticText += "Zulu ";
        break;
      case "0":
        _phoneticText += "Zero ";
        break;
      case "1":
        _phoneticText += "One ";
        break;
      case "2":
        _phoneticText += "Two ";
        break;
      case "3":
        _phoneticText += "Three ";
        break;
      case "4":
        _phoneticText += "Four ";
        break;
      case "5":
        _phoneticText += "Five ";
        break;
      case "6":
        _phoneticText += "Six ";
        break;
      case "7":
        _phoneticText += "Seven ";
        break;
      case "8":
        _phoneticText += "Eight ";
        break;
      case "9":
        _phoneticText += "Nine ";
        break;
      case " ":
        _phoneticText += "Space ";
        break;
    }
  }

  return _phoneticText;
}

String convertToUkrainian(String _str) {
  String _phoneticText = "";

  _str = _str.trim();

  for (int i = 0; i < _str.length; i++) {
    switch (_str[i]) {
      case "а":
      case "А":
        _phoneticText += "Андрі́й ";
        break;
      case "б":
      case "Б":
        _phoneticText += "Богда́н ";
        break;
      case "в":
      case "В":
        _phoneticText += "Васи́ль ";
        break;
      case "г":
      case "Г":
        _phoneticText += "Григо́рій ";
        break;
      case "ґ":
      case "Ґ":
        _phoneticText += "Ґу́дзик ";
        break;
      case "д":
      case "Д":
        _phoneticText += "Дмитро́ ";
        break;
      case "е":
      case "Е":
        _phoneticText += "Ене́й ";
        break;
      case "є":
      case "Є":
        _phoneticText += "Євге́н ";
        break;
      case "ж":
      case "Ж":
        _phoneticText += "Жук ";
        break;
      case "з":
      case "З":
        _phoneticText += "Зено́вій ";
        break;
      case "и":
      case "И":
        _phoneticText += "І́грек ";
        break;
      case "і":
      case "І":
        _phoneticText += "Іва́н ";
        break;
      case "ї":
      case "Ї":
        _phoneticText += "Їжа́к ";
        break;
      case "й":
      case "Й":
        _phoneticText += "Йо́сип ";
        break;
      case "к":
      case "К":
        _phoneticText += "Кілова́т ";
        break;
      case "л":
      case "Л":
        _phoneticText += "Левко́ ";
        break;
      case "м":
      case "М":
        _phoneticText += "Марі́я ";
        break;
      case "н":
      case "Н":
        _phoneticText += "Ната́лка ";
        break;
      case "о":
      case "О":
        _phoneticText += "О́льга ";
        break;
      case "п":
      case "П":
        _phoneticText += "Павло́ ";
        break;
      case "р":
      case "Р":
        _phoneticText += "Рома́н ";
        break;
      case "с":
      case "С":
        _phoneticText += "Степа́н ";
        break;
      case "т":
      case "Т":
        _phoneticText += "Тара́с ";
        break;
      case "у":
      case "У":
        _phoneticText += "Украї́на ";
        break;
      case "ф":
      case "Ф":
        _phoneticText += "Фе́дір ";
        break;
      case "х":
      case "Х":
        _phoneticText += "Христи́на ";
        break;
      case "ц":
      case "Ц":
        _phoneticText += "Центр ";
        break;
      case "ч":
      case "Ч":
        _phoneticText += "Чолові́к ";
        break;
      case "ш":
      case "Ш":
        _phoneticText += "Шу́ра ";
        break;
      case "щ":
      case "Щ":
        _phoneticText += "Щу́ка ";
        break;
      case "ь":
      case "Ь":
        _phoneticText += "Знак ";
        break;
      case "ю":
      case "Ю":
        _phoneticText += "Ю́рій ";
        break;
      case "я":
      case "Я":
        _phoneticText += "Я́ків ";
        break;
      case "0":
        _phoneticText += "Нуль ";
        break;
      case "1":
        _phoneticText += "Один ";
        break;
      case "2":
        _phoneticText += "Два ";
        break;
      case "3":
        _phoneticText += "Три ";
        break;
      case "4":
        _phoneticText += "Чотири ";
        break;
      case "5":
        _phoneticText += "П'ять ";
        break;
      case "6":
        _phoneticText += "Шість ";
        break;
      case "7":
        _phoneticText += "Сім ";
        break;
      case "8":
        _phoneticText += "Вісім ";
        break;
      case "9":
        _phoneticText += "Дев'ять ";
        break;
      case " ":
        _phoneticText += "Пропуск ";
        break;
    }
  }

  return _phoneticText;
}
