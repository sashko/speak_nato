import 'package:flutter_test/flutter_test.dart';

import 'package:speak_nato/nato.dart';

void testSwedishPhonetization() {
  test("test Swedish letters", () {
    var str = phonetizeText("Yxskaftbud, ge vår WC-zonmö IQ-hjälp", "Swedish");
    //expect(str.trim(), "");
  });

  test("test Swedish digits", () {
    var str = phonetizeText("0123456789", "Swedish");
    expect(str.trim(), "Nolla Etta Tvåa Trea Fyra Femma Sexa Sju Åtta Nia");
  });
}

void testICAOPhonetization() {
  test("test ICAO letters", () {
    var str = phonetizeText("The quick brown fox jumps over the lazy dog", "ICAO");
    expect(str.trim(), "Tango Hotel Echo Space Quebec Uniform India Charlie Kilo Space Bravo Romeo Oscar Whiskey November Space Foxtrot Oscar Xray Space Juliett Uniform Mike Papa Sierra Space Oscar Victor Echo Romeo Space Tango Hotel Echo Space Lima Alpha Zulu Yankee Space Delta Oscar Golf");
  });

  test("test ICAO digits", () {
    var str = phonetizeText("0123456789", "ICAO");
    expect(str.trim(), "Zero One Two Three Four Five Six Seven Eight Nine");
  });
}

void main() {
  testSwedishPhonetization();
  testICAOPhonetization();
}
