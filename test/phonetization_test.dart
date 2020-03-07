import 'package:flutter_test/flutter_test.dart';

import 'package:speak_nato/nato.dart';

void testSwedishPhonetization() {
  test("test Swedish letters", () {
    var str = phonetizeText("Yxskaftbud, ge vår WC-zonmö IQ-hjälp", "Swedish");
    expect(
        str.trim(),
        "Yngve Xerxes Sigurd Kalle Adam Filip Tore Bertil Urban David Mellanslag " +
            "Gustav Erik Mellanslag Viktor Åke Rudolf Mellanslag Wilhelm Caesar Zäta Olof Niklas Martin Östen " +
            "Mellanslag Ivar Qvintus Helge Johan Ärlig Ludvig Petter");
  });

  test("test Swedish digits", () {
    var str = phonetizeText("0123456789", "Swedish");
    expect(str.trim(), "Nolla Etta Tvåa Trea Fyra Femma Sexa Sju Åtta Nia");
  });
}

void testICAOPhonetization() {
  test("test ICAO letters", () {
    var str =
        phonetizeText("The quick brown fox jumps over the lazy dog", "ICAO");
    expect(
        str.trim(),
        "Tango Hotel Echo Space Quebec Uniform India Charlie Kilo Space Bravo Romeo Oscar Whiskey November Space " +
            "Foxtrot Oscar Xray Space Juliett Uniform Mike Papa Sierra Space Oscar Victor Echo Romeo Space " +
            "Tango Hotel Echo Space Lima Alpha Zulu Yankee Space Delta Oscar Golf");
  });

  test("test ICAO digits", () {
    var str = phonetizeText("0123456789", "ICAO");
    expect(str.trim(), "Zero One Two Three Four Five Six Seven Eight Nine");
  });
}

void testDXPhonetization() {
  test("test DX letters", () {
    var str = phonetizeText("Glib jocks quiz nymph to vex dwarf", "DX");
    expect(
        str.trim(),
        "Germany London Italy Boston Space Japan Ontario Canada Kilowatt Santiago Space Quebec United Italy " +
            "Zanzibar Space Norway Yokohama Mexico Pacific Honolulu Space Tokyo Ontario Space Victoria England X-Ray " +
            "Space Denmark Washington America Radio France");
  });

  test("test ICAO digits", () {
    var str = phonetizeText("0123456789", "ICAO");
    expect(str.trim(), "Zero One Two Three Four Five Six Seven Eight Nine");
  });
}

void testDXAlternativePhonetization() {
  test("test DX alternative letters", () {
    var str =
        phonetizeText("Sphinx of black quartz, judge my vow", "DX alternative");
    expect(
        str.trim(),
        "Sweden Portugal Hawaii Italy Nicaragua X-Ray Space Ocean Finland Space Baltimore Luxembourg Amsterdan " +
            "Chile Kentucky Space Queen Uruguay Amsterdan Romania Texas Zulu Space Japan Uruguay Denmark Geneva Egypt " +
            "Space Montreal Yokohama Space Venezuela Ocean Washington");
  });

  test("test ICAO digits", () {
    var str = phonetizeText("0123456789", "ICAO");
    expect(str.trim(), "Zero One Two Three Four Five Six Seven Eight Nine");
  });
}

void testUkrainianPhonetization() {
  test("test Ukrainian letters", () {
    var str = phonetizeText(
        "Єхидна, ґава, їжак ще й шиплячі плазуни бігцем форсують Янцзи",
        "Ukrainian");
    expect(
        str.trim(),
        "Євге́н Христи́на І́грек Дмитро́ Ната́лка Андрі́й Пропуск Ґу́дзик Андрі́й Васи́ль Андрі́й Пропуск " +
            "Їжа́к Жук Андрі́й Кілова́т Пропуск Щу́ка Ене́й Пропуск Йо́сип Пропуск " +
            "Шу́ра І́грек Павло́ Левко́ Я́ків Чолові́к Іва́н Пропуск " +
            "Павло́ Левко́ Андрі́й Зено́вій Украї́на Ната́лка І́грек Пропуск " +
            "Богда́н Іва́н Григо́рій Центр Ене́й Марі́я Пропуск " +
            "Фе́дір О́льга Рома́н Степа́н Украї́на Ю́рій Тара́с Знак Пропуск Я́ків Ната́лка Центр Зено́вій І́грек");
  });

  test("test Ukrainian digits", () {
    var str = phonetizeText("0123456789", "Ukrainian");
    expect(
        str.trim(), "Нуль Один Два Три Чотири П'ять Шість Сім Вісім Дев'ять");
  });
}

void testGreekPhonetization() {
  test("test Greek letters", () {
    var str = phonetizeText(
        "διαφυλάξτε γενικά τη ζωή σας από βαθειά ψυχικά τραύματα", "Greek");
    expect(
        str.trim(),
        "Δόξα Ίσκιος Αστήρ Φωφώ Ύμνος Λάμα Ξέρξης Τίγρης Ερμής Χώρος Γαλή Ερμής Ναός Ίσκιος Κενό Χώρος " +
            "Τίγρης Ηρώ Χώρος Ζευς Ωμέγα Χώρος Σοφός Αστήρ Σοφός Χώρος Αστήρ Πέτρος Χώρος " +
            "Βύρων Αστήρ Θεά Ερμής Ίσκιος Χώρος " +
            "Ψυχή Ύμνος Χαρά Ίσκιος Κενό Χώρος Τίγρης Ρήγας Αστήρ Μέλι Αστήρ Τίγρης Αστήρ");
  });

  test("test Greek digits", () {
    var str = phonetizeText("0123456789", "Greek");
    expect(str.trim(), "Μηδέν Ενα Δύο Τρία Τέσσερα Πέντε Εξι Εφτά Οκτώ Εννιά");
  });
}

void testGermanPhonetization() {
  test("test German letters", () {
    var str = phonetizeText(
        "Jeder wackere Bayer vertilgt bequem zwo Schpfund Kalbshaxen.",
        "German");
    expect(
        str.trim(),
        "Julius Emil Dora Emil Richard Leerzeichen Wilhelm Anton Cäsar Kaufmann Emil Richard Emil Leerzeichen " +
            "Berta Anton Ypsilon Emil Richard Leerzeichen " +
            "Viktor Emil Richard Theodor Ida Ludwig Gustav Theodor Leerzeichen " +
            "Berta Emil Quelle Ulrich Emil Martha Leerzeichen Zacharias Wilhelm Otto Leerzeichen " +
            "Schule Paula Friedrich Ulrich Nordpol Dora Leerzeichen " +
            "Kaufmann Anton Ludwig Berta Samuel Heinrich Anton Xanthippe Emil Nordpol Punkt");
  });

  test("test German digits", () {
    var str = phonetizeText("0123456789", "German");
    expect(str.trim(), "Null Eins Zwo Drei Vier Fünf Sechs Sieben Acht Neun");
  });
}

void testGetAlphabet() {
  test("test obtaining alphabet from settings", () {
    expect(alphabet, isNot(""));
  });
}

void main() {
  testSwedishPhonetization();
  testICAOPhonetization();
  testDXPhonetization();
  testDXAlternativePhonetization();
  testGreekPhonetization();
  testGermanPhonetization();
  testUkrainianPhonetization();
  testGetAlphabet();
}
