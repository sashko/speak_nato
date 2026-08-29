// Smoke test: verifies the app builds and renders its main screen.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/main.dart';

void main() {
  testWidgets('MainScreen renders and phonetizes typed text', (
    WidgetTester tester,
  ) async {
    SharedPreferences.setMockInitialValues({'alphabet': 'ICAO', 'fontSize': 26});

    await tester.pumpWidget(const NatoApp());
    await tester.pumpAndSettle();

    expect(find.text('Speak NATO'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'AB');
    await tester.pump();

    expect(find.text('Alpha Bravo '), findsOneWidget);
  });
}
