import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/alphabets.dart';

const alphabetFlags = {
  "ICAO": "\u{2708}\u{FE0F}",
  "DX": "\u{1F4FB}",
  "DX alternative": "\u{1F4FB}",
  "Danish": "\u{1F1E9}\u{1F1F0}",
  "Dutch": "\u{1F1F3}\u{1F1F1}",
  "Finnish": "\u{1F1EB}\u{1F1EE}",
  "French": "\u{1F1EB}\u{1F1F7}",
  "German": "\u{1F1E9}\u{1F1EA}",
  "Greek": "\u{1F1EC}\u{1F1F7}",
  "Italian": "\u{1F1EE}\u{1F1F9}",
  "Norwegian": "\u{1F1F3}\u{1F1F4}",
  "Portuguese": "\u{1F1F5}\u{1F1F9}",
  "Spanish": "\u{1F1EA}\u{1F1F8}",
  "Swedish": "\u{1F1F8}\u{1F1EA}",
  "Ukrainian": "\u{1F1FA}\u{1F1E6}",
};

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _fontDefaultVal = 26;
  String _alphabetDefaultVal = "ICAO";
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadValues();
  }

  Future<void> _loadValues() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      _alphabetDefaultVal = prefs.getString('alphabet') ?? "ICAO";
      _fontDefaultVal = prefs.getInt('fontSize') ?? 26;
      _loaded = true;
    });
  }

  Future<void> _setAlphabet(String alphabet) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('alphabet', alphabet);
    setState(() {
      _alphabetDefaultVal = alphabet;
    });
  }

  Future<void> _setFontSize(int size) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt('fontSize', size);
    setState(() {
      _fontDefaultVal = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Alphabet'),
            subtitle: Text(
              '${alphabetFlags[_alphabetDefaultVal] ?? ""} $_alphabetDefaultVal',
            ),
            onTap: () => _showAlphabetPicker(context),
          ),
          Divider(),
          ListTile(
            title: Text('Font size'),
            subtitle: Text('$_fontDefaultVal'),
          ),
          Slider(
            value: _fontDefaultVal.toDouble(),
            min: 10,
            max: 40,
            divisions: 30,
            label: '$_fontDefaultVal',
            onChanged: (value) {
              _setFontSize(value.round());
            },
          ),
        ],
      ),
    );
  }

  void _showAlphabetPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Select alphabet'),
          children: alphabets.keys.map((name) {
            return SimpleDialogOption(
              onPressed: () {
                _setAlphabet(name);
                Navigator.pop(context);
              },
              child: Text(
                '${alphabetFlags[name] ?? ""} $name',
                style: TextStyle(
                  fontWeight: name == _alphabetDefaultVal
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
