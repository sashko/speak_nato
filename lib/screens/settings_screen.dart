import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/alphabets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int? _fontDefaultVal;
  String? _alphabetDefaultVal;
  bool _loaded = false;
  final _autoValidateMode = AutovalidateMode.onUserInteraction;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _fontSizeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _alphabetKey = GlobalKey<FormState>();

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
      body: Form(
        key: _formKey,
        child: CardSettings(
          children: <CardSettingsSection>[
            CardSettingsSection(
              children: <CardSettingsWidget>[
                CardSettingsListPicker(
                  label: 'Alphabet',
                  key: _alphabetKey,
                  initialItem: _alphabetDefaultVal,
                  items: alphabets.keys.toList(),
                  autovalidateMode: _autoValidateMode,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'You must pick an alphabet';
                    }
                    return null;
                  },
                  onSaved: (value) => _setAlphabet(value.toString()),
                  onChanged: (value) {
                    _setAlphabet(value.toString());
                  },
                ),
                CardSettingsNumberPicker(
                  key: _fontSizeKey,
                  label: 'Font size',
                  initialValue: _fontDefaultVal,
                  min: 10,
                  max: 40,
                  onSaved: (value) => _setFontSize(value!),
                  onChanged: (value) {
                    _setFontSize(value!);
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
