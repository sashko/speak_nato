import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/alphabets.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final String _title = "Phonetic alphabet";
  final double _fontSize = 18.0;
  final String _fontFamily = 'Monospace';

  String _currentAlphabet = "ICAO";

  @override
  void initState() {
    super.initState();
    _loadAlphabet();
  }

  Future<void> _loadAlphabet() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentAlphabet = prefs.getString('alphabet') ?? "ICAO";
    });
  }

  @override
  Widget build(BuildContext context) {
    var letters = alphabets[_currentAlphabet]?.keys.toList() ?? [];
    var words = alphabets[_currentAlphabet]?.values.toList() ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: ListView.builder(
        itemCount: letters.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Text(
                    letters[index].toString(),
                    style: TextStyle(
                      fontSize: _fontSize + 10,
                      fontFamily: _fontFamily,
                    ),
                  ),
                  title: Text(
                    words[index].toString(),
                    style: TextStyle(
                      fontSize: _fontSize,
                      fontFamily: _fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
