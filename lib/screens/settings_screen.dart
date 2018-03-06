import 'package:flutter/material.dart';


class SettingsScreen extends StatelessWidget {
  final String _title = "Settings";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
        )
    );
  }
}