import 'package:flutter_test/flutter_test.dart';

import 'package:speak_nato/nato.dart';

void testSwedishPhonetization() {
  test("test Swedish letters", () {
    var str = phonetizeText("Yxskaftbud, ge vår WC-zonmö IQ-hjälp", "Swedish");
    expect(
      str.trim(),
      "Yngve Xerxes Sigurd Kalle Adam Filip Tore Bertil Urban David , Mellanslag "
      "Gustav Erik Mellanslag Viktor Åke Rudolf Mellanslag Wilhelm Caesar - Zäta Olof Niklas Martin Östen "
      "Mellanslag Ivar Qvintus - Helge Johan Ärlig Ludvig Petter",
    );
  });

  test("test Swedish digits", () {
    var str = phonetizeText("0123456789", "Swedish");
    expect(str.trim(), "Nolla Etta Tvåa Trea Fyra Femma Sexa Sju Åtta Nia");
  });
}

void testICAOPhonetization() {
  test("test ICAO letters", () {
    var str = phonetizeText(
      "The quick brown fox jumps over the lazy dog",
      "ICAO",
    );
    expect(
      str.trim(),
      "Tango Hotel Echo Space Quebec Uniform India Charlie Kilo Space Bravo Romeo Oscar Whiskey November Space "
      "Foxtrot Oscar X-ray Space Juliett Uniform Mike Papa Sierra Space Oscar Victor Echo Romeo Space "
      "Tango Hotel Echo Space Lima Alpha Zulu Yankee Space Delta Oscar Golf",
    );
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
      "Germany London Italy Boston Space Japan Ontario Canada Kilowatt Santiago Space Quebec United Italy "
      "Zanzibar Space Norway Yokohama Mexico Pacific Honolulu Space Tokyo Ontario Space Victoria England X-Ray "
      "Space Denmark Washington America Radio France",
    );
  });

  test("test DX digits", () {
    var str = phonetizeText("0123456789", "DX");
    expect(str.trim(), "Zero One Two Three Four Five Six Seven Eight Nine");
  });
}

void testDXAlternativePhonetization() {
  test("test DX alternative letters", () {
    var str = phonetizeText(
      "Sphinx of black quartz, judge my vow",
      "DX alternative",
    );
    expect(
      str.trim(),
      "Sweden Portugal Hawaii Italy Nicaragua X-Ray Space Ocean Finland Space Baltimore Luxembourg Amsterdam "
      "Chile Kentucky Space Queen Uruguay Amsterdam Romania Texas Zulu , Space Japan Uruguay Denmark Geneva Egypt "
      "Space Montreal Yokohama Space Venezuela Ocean Washington",
    );
  });

  test("test DX alternative digits", () {
    var str = phonetizeText("0123456789", "DX alternative");
    expect(str.trim(), "Zero One Two Three Four Five Six Seven Eight Nine");
  });
}

void testDanishPhonetization() {
  test("test Danish letters", () {
    var str = phonetizeText("Høj bly gom vandt fræk sexquiz på wc", "Danish");
    expect(
      str.trim(),
      "Hans Øresund Johan Plads Bernhard Ludvig Yrsa Plads Georg Odin Mari Plads Viggo Anna Nikolaj "
      "David Theodor Plads Frederik Rasmus Ægir Karen Plads Søren Erik Xerxes Quintus Ulla Ida "
      "Zackarias Plads Peter Aase Plads William Cecilie",
    );
  });

  test("test Danish digits", () {
    var str = phonetizeText("0123456789", "Danish");
    expect(str.trim(), "Nul En To Tre Fire Fem Seks Syv Otte Ni");
  });
}

void testSpanishPhonetization() {
  test("test Spanish letters", () {
    var str = phonetizeText(
      "Whisky bueno: ¡excitad mi frágil pequeña vejez!",
      "Spanish",
    );
    expect(
      str.trim(),
      "Washington Historia Inés Sábado Kilo Yegua Espacio Burgos Ulises España Navarra Oviedo : Espacio "
      "¡ España Xilófono Carmen Inés Toledo Antonio Dolores Espacio Madrid Inés Espacio "
      "Francia Ramón Antonio Granada Inés Lorenzo Espacio Paris España Queso Ulises España Ñoño Antonio "
      "Espacio Valencia España José España Zaragoza !",
    );
  });

  test("test Spanish digits", () {
    var str = phonetizeText("0123456789", "Spanish");
    expect(str.trim(), "Cero Uno Dos Tres Cuatro Cinco Seis Siete Ocho Nueve");
  });
}

void testUkrainianPhonetization() {
  test("test Ukrainian letters", () {
    var str = phonetizeText(
      "Єхидна, ґава, їжак ще й шиплячі плазуни бігцем форсують Янцзи",
      "Ukrainian",
    );
    expect(
      str.trim(),
      "Євге́н Христи́на І́грек Дмитро́ Ната́лка Андрі́й , Пропуск Ґу́дзик Андрі́й Васи́ль Андрі́й , Пропуск "
      "Їжа́к Жук Андрі́й Кілова́т Пропуск Щу́ка Ене́й Пропуск Йо́сип Пропуск "
      "Шу́ра І́грек Павло́ Левко́ Я́ків Чолові́к Іва́н Пропуск "
      "Павло́ Левко́ Андрі́й Зено́вій Украї́на Ната́лка І́грек Пропуск "
      "Богда́н Іва́н Григо́рій Центр Ене́й Марі́я Пропуск "
      "Фе́дір О́льга Рома́н Степа́н Украї́на Ю́рій Тара́с Знак Пропуск Я́ків Ната́лка Центр Зено́вій І́грек",
    );
  });

  test("test Ukrainian digits", () {
    var str = phonetizeText("0123456789", "Ukrainian");
    expect(
      str.trim(),
      "Нуль Один Два Три Чотири П'ять Шість Сім Вісім Дев'ять",
    );
  });
}

void testDutchPhonetization() {
  test("test Dutch letters", () {
    var str = phonetizeText(
      "Pa’s wijze lynx bezag vroom het fikse aquaduct.",
      "Dutch",
    );
    expect(
      str.trim(),
      "Pieter Anton ’ Simon Spatie Willem IJmuiden Zacharias Eduard Spatie Lodewijk Ypsilon Nico Xantippe "
      "Spatie Bernhard Eduard Zacharias Anton Gerard Spatie Victor Richard Otto Otto Maria Spatie Hendrik "
      "Eduard Theodoor Spatie Ferdinand Izaak Karel Simon Eduard Spatie Anton Quirinus Utrecht Anton Dirk "
      "Utrecht Cornelis Theodoor .",
    );
  });

  test("test Dutch digits", () {
    var str = phonetizeText("0123456789", "Dutch");
    expect(str.trim(), "Nul Een Twee Drie Vier Vijf Zes Zeven Acht Negen");
  });
}

void testFinnishPhonetization() {
  test("test Finnish letters", () {
    var str = phonetizeText(
      "Fahrenheit ja Celsius yrjösivät Åsan backgammon-peliin, Volkswagenissa, daiquirin ja ZX81:n yhteisvaikutuksesta",
      "Finnish",
    );
    expect(
      str.trim(),
      "Faarao Aarne Heikki Risto Eemeli Niilo Heikki Eemeli Iivari Tyyne Tila Jussi Aarne Tila Celsius Eemeli "
      "Lauri Sakari Iivari Urho Sakari Tila Yrjö Risto Jussi Öljy Sakari Iivari Vihtori Äiti Tyyne Tila Åke "
      "Sakari Aarne Niilo Tila Bertta Aarne Celsius Kalle Gideon Aarne Matti Matti Otto Niilo - Paavo Eemeli "
      "Lauri Iivari Iivari Niilo , Tila Vihtori Otto Lauri Kalle Sakari Wiski Aarne Gideon Eemeli Niilo Iivari "
      "Sakari Sakari Aarne , Tila Daavid Aarne Iivari Kuu Urho Iivari Risto Iivari Niilo Tila Jussi Aarne Tila "
      "Tseta Äksä Kahdeksan Yksi : Niilo Tila Yrjö Heikki Tyyne Eemeli Iivari Sakari Vihtori Aarne Iivari Kalle "
      "Urho Tyyne Urho Kalle Sakari Eemeli Sakari Tyyne Aarne",
    );
  });

  test("test Finnish digits", () {
    var str = phonetizeText("0123456789", "Finnish");
    expect(
      str.trim(),
      "Nolla Yksi Kaksi Kolme Neljä Viisi Kuusi Seitsemän Kahdeksan Yhdeksän",
    );
  });
}

void testGreekPhonetization() {
  test("test Greek letters", () {
    var str = phonetizeText(
      "διαφυλάξτε γενικά τη ζωή σας από βαθειά ψυχικά τραύματα",
      "Greek",
    );
    expect(
      str.trim(),
      "Δόξα Ίσκιος Αστήρ Φωφώ Ύμνος Λάμα Αστήρ Ξέρξης Τίγρης Ερμής Χώρος Γαλή Ερμής Ναός Ίσκιος Κενό Αστήρ Χώρος "
      "Τίγρης Ηρώ Χώρος Ζευς Ωμέγα Ηρώ Χώρος Σοφός Αστήρ Σοφός Χώρος Αστήρ Πέτρος Οσμή Χώρος "
      "Βύρων Αστήρ Θεά Ερμής Ίσκιος Αστήρ Χώρος "
      "Ψυχή Ύμνος Χαρά Ίσκιος Κενό Αστήρ Χώρος Τίγρης Ρήγας Αστήρ Ύμνος Μέλι Αστήρ Τίγρης Αστήρ",
    );
  });

  test("test Greek digits", () {
    var str = phonetizeText("0123456789", "Greek");
    expect(str.trim(), "Μηδέν Ενα Δύο Τρία Τέσσερα Πέντε Εξι Εφτά Οκτώ Εννιά");
  });
}

void testItalianPhonetization() {
  test("test Italian letters", () {
    var str = phonetizeText("Quel fez sghembo copre davanti", "Italian");
    expect(
      str.trim(),
      "Quadro Udine Empoli Livorno Spazio Firenze Empoli Zara Spazio Savona Genova Hotel Empoli Milano "
      "Bologna Otranto Spazio Como Otranto Padova Roma Empoli Spazio Domodossola Ancona Venezia Ancona "
      "Napoli Torino Imola",
    );
  });

  test("test Italian digits", () {
    var str = phonetizeText("0123456789", "Italian");
    expect(str.trim(), "Zero Uno Due Tre Quattro Cinque Sei Sette Otto Nove");
  });
}

void testNorwegianPhonetization() {
  test("test Norwegian letters", () {
    var str = phonetizeText(
      "Vår sære Zulu fra badeøya spilte jo whist og quickstep i min taxi",
      "Norwegian",
    );
    expect(
      str.trim(),
      "Enkelt-V Åse Rikard Space Sigrid Ærlig Rikard Edith Space Zakarias Ulrik Ludvig Ulrik Space Fredrik "
      "Rikard Anna Space Bernhard Anna David Edith Østen Yngling Anna Space Sigrid Petter Ivar Ludvig "
      "Teodor Edith Space Johan Olivia Space Dobbelt-V Harald Ivar Sigrid Teodor Space Olivia Gustav "
      "Space Quintus Ulrik Ivar Caesar Karin Sigrid Teodor Edith Petter Space Ivar Space Martin Ivar "
      "Nils Space Teodor Anna Xerxes Ivar",
    );
  });

  test("test Norwegian digits", () {
    var str = phonetizeText("0123456789", "Norwegian");
    expect(str.trim(), "Null En To Tre Fire Fem Seks Sju Åtte Ni");
  });
}

void testGermanPhonetization() {
  test("test German letters", () {
    var str = phonetizeText(
      "Jeder wackere Bayer vertilgt bequem zwo Schpfund Kalbshaxen.",
      "German",
    );
    expect(
      str.trim(),
      "Julius Emil Dora Emil Richard Leerzeichen Wilhelm Anton Cäsar Kaufmann Emil Richard Emil Leerzeichen "
      "Berta Anton Ypsilon Emil Richard Leerzeichen "
      "Viktor Emil Richard Theodor Ida Ludwig Gustav Theodor Leerzeichen "
      "Berta Emil Quelle Ulrich Emil Martha Leerzeichen Zacharias Wilhelm Otto Leerzeichen "
      "Schule Paula Friedrich Ulrich Nordpol Dora Leerzeichen "
      "Kaufmann Anton Ludwig Berta Samuel Heinrich Anton Xanthippe Emil Nordpol Punkt",
    );
  });

  test("test German digits", () {
    var str = phonetizeText("0123456789", "German");
    expect(str.trim(), "Null Eins Zwo Drei Vier Fünf Sechs Sieben Acht Neun");
  });
}

void testUnmappedCharacters() {
  test("punctuation with no entry is emitted verbatim", () {
    expect(phonetizeText("A.B", "ICAO").trim(), "Alpha . Bravo");
  });

  test("text in another script is not silently dropped", () {
    expect(phonetizeText("ABC", "Ukrainian").trim(), "A B C");
  });

  test("punctuation the alphabet defines wins over verbatim output", () {
    expect(phonetizeText("A.B", "German").trim(), "Anton Punkt Berta");
  });
}

void testAccentFolding() {
  test("accented letters fold to their base letter", () {
    expect(phonetizeText("ά", "Greek").trim(), "Αστήρ");
    expect(phonetizeText("ή", "Greek").trim(), "Ηρώ");
    expect(phonetizeText("á", "Spanish").trim(), "Antonio");
    expect(phonetizeText("ü", "Spanish").trim(), "Ulises");
  });

  test("letters the alphabet defines in its own right are never folded", () {
    expect(phonetizeText("Å", "Swedish").trim(), "Åke");
    expect(phonetizeText("Ö", "Finnish").trim(), "Öljy");
    expect(phonetizeText("Æ", "Danish").trim(), "Ægir");
    expect(phonetizeText("Ø", "Norwegian").trim(), "Østen");
    expect(phonetizeText("Ñ", "Spanish").trim(), "Ñoño");
    expect(phonetizeText("Ü", "German").trim(), "Übermut");
  });
}

void testAlphabetSelection() {
  test("an unknown alphabet falls back to ICAO", () {
    expect(phonetizeText("AB", "Nonexistent").trim(), "Alpha Bravo");
  });

  test("multi-character patterns win over single letters", () {
    expect(phonetizeText("ij", "Dutch").trim(), "IJmuiden");
    expect(phonetizeText("sch", "German").trim(), "Schule");
  });

  // Patterns are matched against str.toUpperCase(), so digraph keys must be
  // stored uppercase to be reachable at all.
  test("Spanish digraphs CH and LL spell as a single letter", () {
    expect(
      phonetizeText("lluvia", "Spanish").trim(),
      "Llave Ulises Valencia Inés Antonio",
    );
    expect(
      phonetizeText("cachorro", "Spanish").trim(),
      "Carmen Antonio Chocolate Oviedo Ramón Ramón Oviedo",
    );
  });
}

void main() {
  testSwedishPhonetization();
  testICAOPhonetization();
  testDXPhonetization();
  testDXAlternativePhonetization();
  testDanishPhonetization();
  testDutchPhonetization();
  testFinnishPhonetization();
  testGreekPhonetization();
  testItalianPhonetization();
  testNorwegianPhonetization();
  testGermanPhonetization();
  testSpanishPhonetization();
  testUkrainianPhonetization();
  testUnmappedCharacters();
  testAccentFolding();
  testAlphabetSelection();
}
