import 'package:flutter/material.dart';

// Holds the current theme state (light/dark) and notifies listeners on change.
class ThemeProvider with ChangeNotifier {
  // Private field that tracks whether dark mode is active.
  bool _isDarkTheme = false;

  // Initialize theme based on the device's current system brightness.
  ThemeProvider() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _isDarkTheme = brightness == Brightness.dark;
  }

  // Public read‑only access to the current theme value.
  bool get isDarkTheme => _isDarkTheme;

  // Flip between light and dark theme, then notify UI to rebuild.
  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    // Tells all listening widgets to rebuild with the new theme value.
    notifyListeners();
  }
}
