import 'package:flutter/material.dart';


void main() {
  runApp(new NatoApp());
}

class NatoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Speak NATO',
      home: new Scaffold(appBar: new AppBar(title: new Text('Speak NATO'),),
      ),
    );
  }
}
