import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pf_29_integration_testing/main.dart' as app;

void main() {
  // Ensures that the integration_test binding is initialized.
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CounterPage integration test', () {
    testWidgets('taps the button and verifies the counter text', (
      tester,
    ) async {
      // 1. Launch the app.
      app.main();

      // 2. Wait for all widgets to build and settle.
      await tester.pumpAndSettle();

      // 3. Verify that the initial counter text is "0".
      final counterTextFinder = find.byKey(const Key('counter_text'));
      expect(counterTextFinder, findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      // 4. Tap the FloatingActionButton.
      final incrementButtonFinder = find.byKey(const Key('increment_button'));
      await tester.tap(incrementButtonFinder);

      // 5. Rebuild and settle animations.
      await tester.pumpAndSettle();

      // 6. Verify that the counter text changed to "1".
      expect(find.text('1'), findsOneWidget);
    });
  });
}
