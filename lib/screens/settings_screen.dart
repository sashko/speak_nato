import "dart:async";

import 'package:speak_nato/nato.dart';
import 'package:speak_nato/screens/main_screen.dart';
import 'package:speak_nato/preferences.dart';
import 'package:speak_nato/alphabets.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:card_settings/card_settings.dart';

int _fontDefaultVal;
String _alphabetDefaultVal;

Future getInitialValues() async {
  var prefs = await SharedPreferences.getInstance();

  _alphabetDefaultVal = prefs.getString('alphabet');
  _fontDefaultVal = prefs.getInt('fontSize');

  if (null == _fontDefaultVal) {
    prefs.setInt('fontSize', 26);

    _fontDefaultVal = prefs.getInt('fontSize');
    textSize = prefs.getInt('fontSize').toDouble();
  }

  if (null == _alphabetDefaultVal) {
    prefs.setString('alphabet', "ICAO");

    _alphabetDefaultVal = prefs.getString('alphabet');
    alphabet = prefs.getString('alphabet');
  }

  alphabet = prefs.getString('alphabet');
  textSize = prefs.getInt('fontSize').toDouble();
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreen createState() => new _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  _setAlphabet(String _alphabet) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString('alphabet', _alphabet);
    _alphabetDefaultVal = _alphabet;
  }

  _setFontSize(int _size) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setInt("fontSize", _size);
    _fontDefaultVal = _size;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _fontSizeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _alphabetKey = GlobalKey<FormState>();
  var title = "title";
  var url = "https://google.com";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('Settings')),
      body: Form(
        key: _formKey,
        child: CardSettings(
          children: <CardSettingsSection>[
            CardSettingsSection(
              children: <CardSettingsWidget>[
                CardSettingsListPicker(
                  label: 'Alphabet',
                  key: _alphabetKey,
                  initialValue: _alphabetDefaultVal,
                  options: alphabets.keys.toList(),
                  autovalidate: false,
                  validator: (String value) {
                    if (value == null || value.isEmpty)
                      return 'You must pick an alphabet';
                    return null;
                  },
                  onSaved: (value) => _setAlphabet(value),
                  onChanged: (value) {
                    setState(() {
                      _setAlphabet(value);
                    });
                  },
                ),
                CardSettingsNumberPicker(
                  key: _fontSizeKey,
                  label: 'Font size',
                  initialValue: _fontDefaultVal,
                  min: 10,
                  max: 40,
                  onSaved: (value) => _setFontSize(value),
                  onChanged: (value) {
                    setState(() {
                      _setFontSize(value);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
