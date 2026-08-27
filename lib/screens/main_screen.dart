import "dart:async";

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:speak_nato/nato.dart';
import 'package:speak_nato/preferences.dart';
import 'package:speak_nato/screens/settings_screen.dart';

double? textSize;
FlutterTts? tts;

enum TtsState { playing, stopped }

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  NatoAppState createState() => NatoAppState();
}

class NatoAppState extends State<MainScreen> {
  final _title = "Speak NATO";
  String _phonetizedText = "";

  var tts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  Icon ttsButton = Icon(Icons.volume_up);

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() async {
    tts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    tts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
        ttsButton = Icon(Icons.volume_up);
      });
    });

    tts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
      Flushbar(
          message: "Could not use Text to Speech",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red)
        .show(context);
    });
  }

  void onTextChanged(String str) {
    setState(() {
      _phonetizedText = phonetizeText(str);
    });
  }

  Future speak(String text) async {
    if (getLanguage(tts) == null) {
      Flushbar(
          message: "Language is not available for Text to Speech",
          duration: Duration(seconds: 5),
          backgroundColor: Colors.red)
        .show(context);

      return;
    }

    await tts.setLanguage(await getLanguage(tts) ?? "");

    var result = await tts.speak(text);
    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future stop() async {
    var result = await tts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    // obtain settings
    getInitialValues();

    return MaterialApp(
      title: _title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(title: Text(_title), actions: <Widget>[
            IconButton(
              icon: Icon(Icons.view_list),
              onPressed: () {
                Navigator.of(context).pushNamed('/AlphabetScreen');
              },
            ),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed('/SettingsScreen');
                })
          ]),
          body: Container(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
            child: Column(children: <Widget>[
              TextField(
                  autocorrect: false,
                  autofocus: true,
                  decoration: InputDecoration(),
                  textAlign: TextAlign.center,
                  maxLength: 60,
                  onChanged: (String str) {
                    onTextChanged(str);
                  },
                  onSubmitted: (String str) {
                    onTextChanged(str);
                  }),
              Padding(
                padding: EdgeInsets.only(top: 120.0),
              ),
              SelectableText(
                _phonetizedText,
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
              elevation: 0.0,
              child: ttsButton,
              onPressed: () {
                // separate words with a dot, so tts takes a pause in between words
                var text = _phonetizedText.replaceAll(RegExp(r' '), '. ');
                if (ttsState == TtsState.stopped) {
                  ttsButton = Icon(Icons.stop);
                  setState(() {});
                  speak(text);
                } else {
                  ttsButton = Icon(Icons.volume_up);
                  setState(() {});
                  stop();
                }
              })),
    );
  }
}
