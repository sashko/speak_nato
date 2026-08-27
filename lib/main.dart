import 'package:flutter/material.dart';

import 'package:speak_nato/screens/alphabet_screen.dart';
import 'package:speak_nato/screens/main_screen.dart';
import 'package:speak_nato/screens/settings_screen.dart';

void main() {
  runApp(NatoApp());
}

class NatoApp extends StatelessWidget {
  final String _title = "Speak NATO";

  const NatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: <String, WidgetBuilder>{
        '/MainScreen': (BuildContext context) => MainScreen(),
        '/AlphabetScreen': (BuildContext context) => AlphabetScreen(),
        '/SettingsScreen': (BuildContext context) => SettingsScreen(),
      },
      home: MainScreen(),
    );
  }
}
