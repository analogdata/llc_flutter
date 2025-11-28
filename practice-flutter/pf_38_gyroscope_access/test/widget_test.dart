import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pf_38_gyroscope_access/main.dart';

void main() {
  testWidgets('App starts smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title exists
    expect(find.text('Gyroscope Access'), findsOneWidget);
    expect(find.text('Raw Gyroscope Values'), findsOneWidget);
  });
}
