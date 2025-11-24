# pf_29_integration_testing

This project is a **minimal Flutter example for integration testing**.

The app shows a single counter screen and an integration test that
simulates a real user tapping a button and verifies the UI updates.

---

## App overview

- **Main entrypoint**: `lib/main.dart`
- **Main widget**: `CounterPage`

The app:

- Displays a counter starting at `0`.
- Has a `FloatingActionButton` with a `+` icon.
- When the button is tapped, the counter increments by `1`.

To make the screen easy to drive from tests, the important widgets have keys:

- `Key('counter_text')` on the `Text` widget that shows the counter.
- `Key('increment_button')` on the `FloatingActionButton`.

---

## Integration test

- **Test file**: `integration_test/app_test.dart`

What the test does:

1. Initializes the integration test binding.
2. Calls `app.main()` to launch the real app.
3. Waits for the app to build using `pumpAndSettle()`.
4. Finds the counter text by key and verifies it starts at `0`.
5. Finds the increment button by key and taps it.
6. Waits for the UI to update.
7. Verifies that the counter text is now `1`.

The test uses the `integration_test` and `flutter_test` packages and interacts
with the UI in the same way a user would, rather than just testing widgets in
isolation.

---

## Running the example

### 1. Install dependencies

From the project root:

```bash
flutter pub get
```

Make sure `integration_test` is included under `dev_dependencies` in
`pubspec.yaml` (already configured in this project).

### 2. Run the integration test

With an emulator or device connected, run:

```bash
flutter test integration_test/app_test.dart
```

This will build the app, run the integration test, and report the results in
the console.

---

## Files summary

- `lib/main.dart`
  - Defines `MyApp` and `CounterPage`.
  - Adds keys to the counter text and increment button to make them easy to
    find in tests.

- `integration_test/app_test.dart`
  - Contains a single integration test that launches the app and verifies
    the counter behavior end-to-end.

Use this project as a starting point to add more screens and more complex
integration tests.
