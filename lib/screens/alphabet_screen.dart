import 'package:speak_nato/alphabets.dart';
import 'package:speak_nato/preferences.dart';
import 'package:speak_nato/nato.dart';

import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

class AlphabetScreen extends StatelessWidget {
  final String _title = "Phonetic alphabet";

  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

  final FlutterTts tts = new FlutterTts();

  List getLetters() {
    switch (alphabet) {
      case "ICAO":
        return lettersICAO;
      case "Swedish":
        return lettersSwedish;
      case "Ukrainian":
        return lettersUkrainian;
      default:
        return lettersICAO;
    }
  }

  List getWords() {
    switch (alphabet) {
      case "ICAO":
        return wordsICAO;
      case "Swedish":
        return wordsSwedish;
      case "Ukrainian":
        return wordsUkrainian;
      default:
        return wordsICAO;
    }
  }

  @override
  Widget build(BuildContext context) {
    pronounceWord(String text) async {
      if (getLanguage() == null) {
        return;
      }

      await tts.setLanguage(await getLanguage());

      tts.speak(text);
    }

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
        ),
        body: new ListView.builder(
            itemCount: getLetters().length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: new Column(children: <Widget>[
                new ListTile(
                    leading: new Text(getLetters()[index],
                        style: new TextStyle(
                            fontSize: _fontSize + 10, fontFamily: _fontFamily)),
                    title: new Text(getWords()[index],
                        style: new TextStyle(
                            fontSize: _fontSize, fontFamily: _fontFamily)),
                    onTap: () {
                      pronounceWord(getWords()[index]);
                    }),
              ]));
            }));
  }
}
