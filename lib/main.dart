import 'package:flutter/material.dart';


void main() {
  runApp(new NatoApp());
}

class NatoApp extends StatefulWidget {
  NatoAppState createState() => new NatoAppState();
}

class NatoAppState extends State<NatoApp> {
  String _title = "Speak NATO";
  String _natoText = "";

  void onTextChanged(String str) {
    setState(() {
      _natoText = str;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: _title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
        ),
        body: new Container(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                autocorrect: false,
                autofocus: true,
                decoration: new InputDecoration(
                  hintText: 'text to NATOnize...',
                ),
                textAlign: TextAlign.center,
                maxLength: 256,
                onChanged: (String str) {
                  onTextChanged(str);
                },
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 120.0),
              ),
              new Text(
                _natoText,
                style: new TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ]
          ),
        )
      ),
    );
  }
}
