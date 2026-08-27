import 'package:flutter/material.dart';
import 'package:speak_nato/alphabets.dart';
import 'package:speak_nato/nato.dart';

class AlphabetScreen extends StatelessWidget {
  final String _title = "Phonetic alphabet";

  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

  const AlphabetScreen({super.key});

//  final FlutterTts tts = new FlutterTts();

  List getLetters() {
    return alphabets[alphabet]!.keys.toList();
  }

  List getWords() {
    return alphabets[alphabet]!.values.toList();
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

    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView.builder(
            itemCount: getLetters().length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Column(children: <Widget>[
                ListTile(
                    leading: Text(getLetters()[index].toString(),
                        style: TextStyle(
                            fontSize: _fontSize + 10, fontFamily: _fontFamily)),
                    title: Text(getWords()[index].toString(),
                        style: TextStyle(
                            fontSize: _fontSize, fontFamily: _fontFamily)),
//                    trailing: Icon(Icons.volume_up),
                    onTap: () {
                      //pronounceWord(getWords()[index]);
                    }),
              ]));
            }));
  }
}
