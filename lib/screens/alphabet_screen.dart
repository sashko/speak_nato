import 'package:speak_nato/alphabets.dart';
import 'package:speak_nato/preferences.dart';
import 'package:speak_nato/nato.dart';

import 'package:flutter/material.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlphabetScreen extends StatelessWidget {
  final String _title = "Phonetic alphabet";

  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

//  final FlutterTts tts = new FlutterTts();

  List getLetters() {
    return alphabets[alphabet].keys.toList();
  }

  List getWords() {
    return alphabets[alphabet].values.toList();
  }

  @override
  Widget build(BuildContext context) {
/*    pronounceWord(String text) async {
      if (getLanguage() == null) {
        Flushbar(
            message: "Language is not available for Text to Speech",
            duration: Duration(seconds: 5),
            backgroundColor: Colors.red)
          ..show(context);

        return;
      }*/

//      await tts.setLanguage(await getLanguage());

//      tts.speak(text);
    //}

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
//                    trailing: Icon(Icons.volume_up),
                    onTap: () {
                      //pronounceWord(getWords()[index]);
                    }),
              ]));
            }));
  }
}
