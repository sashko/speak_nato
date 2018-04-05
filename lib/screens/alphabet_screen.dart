import "dart:async";

import 'package:speak_nato/alphabets.dart';
import 'package:speak_nato/nato.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tts/tts.dart';

class AlphabetScreen extends StatelessWidget {
  final String _title = "Phonetic alphabet";

  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

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
    Future<String> getLanguage() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String _alphabet = prefs.getString('alphabet');
      String language;
      bool isLangAvailable;

      switch (_alphabet) {
        case "ICAO":
          language = "en-US";
          break;
        case "Swedish":
          language = "sv-SE";
          break;
        case "Ukrainian":
          language = "uk-UA";
          break;
        default:
          language = "en-US";
      }

      isLangAvailable = await Tts.isLanguageAvailable(language);
      if (isLangAvailable) {
        return "en-US";
      } else {
        return null;
      }
    }

    pronounceWord(String text) async {
      if (getLanguage() == null) {
        return;
      }

      await Tts.setLanguage(await getLanguage());

      Tts.speak(text);
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
