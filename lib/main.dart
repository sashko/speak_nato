import 'package:speak_nato/screens/alphabet_screen.dart';
import 'package:speak_nato/screens/main_screen.dart';
import 'package:speak_nato/screens/settings_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(new NatoApp());
}

class NatoApp extends StatelessWidget {
  final String _title = "Speak NATO";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        '/MainScreen': (BuildContext context) => new MainScreen(),
        '/AlphabetScreen': (BuildContext context) => new AlphabetScreen(),
        '/SettingsScreen': (BuildContext context) => new SettingsScreen(),
      },
      home: new MainScreen(),
    );
  }
}
