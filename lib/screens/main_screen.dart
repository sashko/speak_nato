import 'package:speak_nato/nato.dart';
import 'package:speak_nato/screens/settings_screen.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  NatoAppState createState() => new NatoAppState();
}

class NatoAppState extends State<MainScreen> {
  String _title = "Speak NATO";
  String _phonetizedText = "";

  void onTextChanged(String str) {
    setState(() {
      _phonetizedText = phonetizeText(str);
    });
  }

  @override
  Widget build(BuildContext context) {
    // obtain settings
    getInitialValues();

    return new MaterialApp(
      title: _title,
      home: new Scaffold(
          appBar: new AppBar(title: new Text(_title), actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.view_list),
              onPressed: () {
                Navigator.of(context).pushNamed('/AlphabetScreen');
              },
            ),
            new IconButton(
                icon: new Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed('/SettingsScreen');
                })
          ]),
          body: new Container(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: new Column(children: <Widget>[
              new TextField(
                autocorrect: false,
                autofocus: true,
                decoration: new InputDecoration(
                  hintText: 'type here...',
                ),
                textAlign: TextAlign.center,
                maxLength: 60,
                onChanged: (String str) {
                  onTextChanged(str);
                },
                onSubmitted: (String str) {
                  onTextChanged(str);
                }),
              new Padding(
                padding: new EdgeInsets.only(top: 120.0),
              ),
              new Text(
                _phonetizedText,
                style: new TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          )),
    );
  }
}
