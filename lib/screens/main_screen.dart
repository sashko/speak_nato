import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/nato.dart';
import 'package:speak_nato/preferences.dart';

enum TtsState { playing, stopped }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  NatoAppState createState() => NatoAppState();
}

class NatoAppState extends State<MainScreen> {
  final _title = "Speak NATO";
  String _phonetizedText = "";
  String _currentAlphabet = "ICAO";
  double _textSize = 26.0;
  String _currentInput = "";

  final _tts = FlutterTts();
  TtsState _ttsState = TtsState.stopped;
  Icon _ttsButton = Icon(Icons.volume_up);

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _initTts();
  }

  Future<void> _loadPreferences() async {
    var prefs = await SharedPreferences.getInstance();

    var alphabet = prefs.getString('alphabet') ?? "ICAO";
    var fontSize = prefs.getInt('fontSize') ?? 26;

    if (!prefs.containsKey('alphabet')) {
      await prefs.setString('alphabet', "ICAO");
    }
    if (!prefs.containsKey('fontSize')) {
      await prefs.setInt('fontSize', 26);
    }

    setState(() {
      _currentAlphabet = alphabet;
      _textSize = fontSize.toDouble();
      if (_currentInput.isNotEmpty) {
        _phonetizedText = phonetizeText(_currentInput, _currentAlphabet);
      }
    });
  }

  void _initTts() {
    _tts.setStartHandler(() {
      setState(() {
        _ttsState = TtsState.playing;
      });
    });

    _tts.setCompletionHandler(() {
      setState(() {
        _ttsState = TtsState.stopped;
        _ttsButton = Icon(Icons.volume_up);
      });
    });

    _tts.setErrorHandler((msg) {
      setState(() {
        _ttsState = TtsState.stopped;
      });
      Flushbar(
        message: "Could not use Text to Speech",
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ).show(context);
    });
  }

  void _onTextChanged(String str) {
    _currentInput = str;
    setState(() {
      _phonetizedText = phonetizeText(str, _currentAlphabet);
    });
  }

  Future<void> _speak(String text) async {
    if (getLanguage(_tts) == null) {
      Flushbar(
        message: "Language is not available for Text to Speech",
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
      ).show(context);
      return;
    }

    await _tts.setLanguage(await getLanguage(_tts) ?? "");
    var result = await _tts.speak(text);
    if (result == 1) setState(() => _ttsState = TtsState.playing);
  }

  Future<void> _stop() async {
    var result = await _tts.stop();
    if (result == 1) setState(() => _ttsState = TtsState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              Navigator.of(context).pushNamed('/AlphabetScreen');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              await Navigator.of(context).pushNamed('/SettingsScreen');
              _loadPreferences();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            TextField(
              autocorrect: false,
              autofocus: true,
              decoration: InputDecoration(),
              textAlign: TextAlign.center,
              maxLength: 60,
              onChanged: _onTextChanged,
              onSubmitted: _onTextChanged,
            ),
            Padding(padding: EdgeInsets.only(top: 120.0)),
            SelectableText(
              _phonetizedText,
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontSize: _textSize,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: _ttsButton,
        onPressed: () {
          var text = _phonetizedText.replaceAll(RegExp(r' '), '. ');
          if (_ttsState == TtsState.stopped) {
            _ttsButton = Icon(Icons.stop);
            setState(() {});
            _speak(text);
          } else {
            _ttsButton = Icon(Icons.volume_up);
            setState(() {});
            _stop();
          }
        },
      ),
    );
  }
}
