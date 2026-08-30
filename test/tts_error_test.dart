import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:speak_nato/main.dart';

const _ttsChannel = MethodChannel('flutter_tts');

/// Answers the calls MainScreen makes while starting speech, so the flow gets
/// far enough to show the stop icon.
void _stubTtsPlatform() {
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(_ttsChannel, (call) async {
        switch (call.method) {
          case 'isLanguageAvailable':
            return true;
          case 'speak':
          case 'stop':
          case 'setLanguage':
          case 'awaitSpeakCompletion':
            return 1;
        }
        return null;
      });
}

/// Simulates the platform reporting a failure part way through speaking.
Future<void> _emitSpeakError(String message) async {
  await TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .handlePlatformMessage(
        _ttsChannel.name,
        const StandardMethodCodec().encodeMethodCall(
          MethodCall('speak.onError', message),
        ),
        (_) {},
      );
}

Icon _fabIcon(WidgetTester tester) =>
    tester.widget<FloatingActionButton>(find.byType(FloatingActionButton)).child
        as Icon;

void main() {
  testWidgets('a speech error restores the idle button icon', (tester) async {
    SharedPreferences.setMockInitialValues({
      'alphabet': 'ICAO',
      'fontSize': 26,
    });
    _stubTtsPlatform();

    await tester.pumpWidget(const NatoApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'AB');
    await tester.pump();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(
      _fabIcon(tester).icon,
      Icons.stop,
      reason: 'tapping should show the stop icon while speaking',
    );

    await _emitSpeakError('engine unavailable');
    await tester.pump();

    expect(_fabIcon(tester).icon, Icons.volume_up);
  });
}
