/*
  Copyright 2014 The Chromium Authors.
  Copyright 2018 Oleksandr Kravchuk.
*/
import "dart:async";

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speak_nato/nato.dart';

enum _Alphabets { ICAO, Swedish, Ukrainian }
var _alphabetDefaultVal;

typedef Widget SettingItemBodyBuilder<T>(SettingItem<T> item);
typedef String ValueToString<T>(T value);

Future getInitialValues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  switch (prefs.getString('alphabet')) {
    case "ICAO":
      _alphabetDefaultVal = _Alphabets.ICAO;
      alphabet = "ICAO";
      break;
    case "Swedish":
      _alphabetDefaultVal = _Alphabets.Swedish;
      alphabet = "Swedish";
      break;
    case "Ukrainian":
      _alphabetDefaultVal = _Alphabets.Ukrainian;
      alphabet = "Ukrainian";
      break;
    default:
      _alphabetDefaultVal = _Alphabets.ICAO;
      alphabet = "ICAO";
      break;
  }
}

class DualHeaderWithHint extends StatelessWidget {
  const DualHeaderWithHint({this.name, this.value, this.hint, this.showHint});

  final String name;
  final String value;
  final String hint;
  final bool showHint;

  Widget _crossFade(Widget first, Widget second, bool isExpanded) {
    return new AnimatedCrossFade(
      firstChild: first,
      secondChild: second,
      firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
      secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
      sizeCurve: Curves.fastOutSlowIn,
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return new Row(children: <Widget>[
      new Expanded(
        flex: 2,
        child: new Container(
          margin: const EdgeInsets.only(left: 24.0),
          child: new FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: new Text(
              name,
              style: textTheme.body1.copyWith(fontSize: 15.0),
            ),
          ),
        ),
      ),
      new Expanded(
          flex: 3,
          child: new Container(
              margin: const EdgeInsets.only(left: 24.0),
              child: _crossFade(
                  new Text(value,
                      style: textTheme.caption.copyWith(fontSize: 15.0)),
                  new Text(hint,
                      style: textTheme.caption.copyWith(fontSize: 15.0)),
                  showHint)))
    ]);
  }
}

class CollapsibleBody extends StatelessWidget {
  const CollapsibleBody(
      {this.margin: EdgeInsets.zero, this.child, this.onSave, this.onCancel});

  final EdgeInsets margin;
  final Widget child;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return new Column(children: <Widget>[
      new Container(
          margin: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0) -
              margin,
          child: new Center(
              child: new DefaultTextStyle(
                  style: textTheme.caption.copyWith(fontSize: 15.0),
                  child: child))),
      const Divider(height: 1.0),
      new Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: new FlatButton(
                        onPressed: onCancel,
                        child: const Text('CANCEL',
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500)))),
                new Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: new FlatButton(
                        onPressed: onSave,
                        textTheme: ButtonTextTheme.accent,
                        child: const Text('SAVE')))
              ]))
    ]);
  }
}

class SettingItem<T> {
  SettingItem(
      {this.name, this.value, this.hint, this.builder, this.valueToString})
      : textController = new TextEditingController(text: valueToString(value));

  final String name;
  final String hint;
  final TextEditingController textController;
  final SettingItemBodyBuilder<T> builder;
  final ValueToString<T> valueToString;
  T value;
  bool isExpanded = false;

  ExpansionPanelHeaderBuilder get headerBuilder {
    return (BuildContext context, bool isExpanded) {
      return new DualHeaderWithHint(
          name: name,
          value: valueToString(value),
          hint: hint,
          showHint: isExpanded);
    };
  }

  Widget build() => builder(this);
}

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/material/expansion_panels';

  @override
  _SettingsScreen createState() => new _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  List<SettingItem<dynamic>> _settingItems;

  _setAlphabet(String _alphabet) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('alphabet', _alphabet);
    alphabet = _alphabet;
  }

  @override
  void initState() {
    super.initState();

    _settingItems = <SettingItem<dynamic>>[
      new SettingItem<_Alphabets>(
          name: 'Alphabet',
          value: _alphabetDefaultVal,
          hint: 'Select alphabet',
          valueToString: (_Alphabets location) =>
              location.toString().split('.')[1],
          builder: (SettingItem<_Alphabets> item) {
            void close() {
              setState(() {
                item.isExpanded = false;
              });
            }

            return new Form(child: new Builder(builder: (BuildContext context) {
              return new CollapsibleBody(
                onSave: () {
                  Form.of(context).save();
                  close();
                },
                onCancel: () {
                  Form.of(context).reset();
                  close();
                },
                child: new FormField<_Alphabets>(
                    initialValue: _alphabetDefaultVal,
                    onSaved: (_Alphabets result) {
                      item.value = result;
                      _setAlphabet(result.toString().substring(11));
                    },
                    builder: (FormFieldState<_Alphabets> field) {
                      return new Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Radio<_Alphabets>(
                                    value: _Alphabets.ICAO,
                                    groupValue: field.value,
                                    onChanged: field.onChanged,
                                  ),
                                  const Text('ICAO / NATO')
                                ]),
                            new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Radio<_Alphabets>(
                                    value: _Alphabets.Swedish,
                                    groupValue: field.value,
                                    onChanged: field.onChanged,
                                  ),
                                  const Text('Swedish')
                                ]),
                            new Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Radio<_Alphabets>(
                                    value: _Alphabets.Ukrainian,
                                    groupValue: field.value,
                                    onChanged: field.onChanged,
                                  ),
                                  const Text('Ukrainian')
                                ]),
                          ]);
                    }),
              );
            }));
          }),
      new SettingItem<double>(
          name: 'Text size',
          value: 26.0,
          hint: 'Select text size',
          valueToString: (double amount) => '${amount.round()}',
          builder: (SettingItem<double> item) {
            void close() {
              setState(() {
                item.isExpanded = false;
              });
            }

            return new Form(child: new Builder(builder: (BuildContext context) {
              return new CollapsibleBody(
                onSave: () {
                  Form.of(context).save();
                  close();
                },
                onCancel: () {
                  Form.of(context).reset();
                  close();
                },
                child: new FormField<double>(
                  initialValue: item.value,
                  onSaved: (double value) {
                    item.value = value;
                  },
                  builder: (FormFieldState<double> field) {
                    return new Slider(
                      min: 1.0,
                      max: 60.0,
                      activeColor: Colors.orange[60 + (field.value * 0.5).round()],
                      label: '${field.value.round()}',
                      value: field.value,
                      onChanged: field.onChanged,
                    );
                  },
                ),
              );
            }));
          })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: const Text('Phonetic alphabet')),
      body: new SingleChildScrollView(
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new Container(
            margin: const EdgeInsets.all(24.0),
            child: new ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _settingItems[index].isExpanded = !isExpanded;
                  });
                },
                children: _settingItems.map((SettingItem<dynamic> item) {
                  return new ExpansionPanel(
                      isExpanded: item.isExpanded,
                      headerBuilder: item.headerBuilder,
                      body: item.build());
                }).toList()),
          ),
        ),
      ),
    );
  }
}
