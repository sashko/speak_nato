import 'package:flutter/material.dart';


class AlphabetScreen extends StatelessWidget {
  final String _title = "Prhonetic alphabet";

  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

  final List _english = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                         "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  final List _nato = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf",
                      "Hotel", "India", "Juliett", "Kilo", "Lima", "Mike", "November",
                      "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform",
                      "Victor", "Whiskey", "Xray", "Yankee", "Zulu"];

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
            child: new Column(
              children: <Widget>[
                new ListTile(
                  leading: new Text(
                    _english[index],
                    style: new TextStyle(fontSize: _fontSize + 10, fontFamily: _fontFamily)),
                  title: new Text(
                    _nato[index],
                     style: new TextStyle(fontSize: _fontSize, fontFamily: _fontFamily)),
                ),
              ]
            )
          );
        }
      )
    );
  }
}