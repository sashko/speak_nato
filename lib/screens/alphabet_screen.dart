import 'package:speak_nato/alphabets.dart';

import 'package:flutter/material.dart';

class AlphabetScreen extends StatelessWidget {
  final String _title = "Phonetic alphabet";

  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
        ),
        body: new ListView.builder(
            itemCount: 26,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                  child: new Column(children: <Widget>[
                new ListTile(
                  leading: new Text(letters[index],
                      style: new TextStyle(
                          fontSize: _fontSize + 10, fontFamily: _fontFamily)),
                  title: new Text(words[index],
                      style: new TextStyle(
                          fontSize: _fontSize, fontFamily: _fontFamily)),
                ),
              ]));
            }));
  }
}
