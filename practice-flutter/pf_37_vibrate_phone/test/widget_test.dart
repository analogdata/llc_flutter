import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pf_37_vibrate_phone/main.dart';

void main() {
  testWidgets('Vibration app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VibrationDemoApp());

    // Verify that the title is present.
    expect(find.text('Vibration Patterns'), findsOneWidget);
  });
}
