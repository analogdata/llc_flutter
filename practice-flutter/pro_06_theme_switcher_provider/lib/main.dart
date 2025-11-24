import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pro_06_theme_switcher_provider/theme_provider.dart';

void main() {
  runApp(
    // Expose ThemeProvider to the whole widget tree using ChangeNotifierProvider.
    ChangeNotifierProvider(
      // Create a single ThemeProvider instance that holds the current theme state.
      create: (_) => ThemeProvider(),
      child: const ThemeSwitcher(),
    ),
  );
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    // Read ThemeProvider from the widget tree; rebuilds when theme changes.
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Theme Switcher',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Switcher', style: GoogleFonts.outfit()),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'It uses Provider for theme management with change notifications and automatic UI updates when the theme changes - try the button!',
              style: GoogleFonts.outfit(height: 1.5, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Ask ThemeProvider to flip between light and dark mode.
          onPressed: () => themeProvider.toggleTheme(),
          child: Icon(
            themeProvider.isDarkTheme ? Icons.wb_sunny : Icons.brightness_2,
          ),
        ),
      ),
      // Start from system theme (via ThemeProvider constructor) but
      // allow the user to override it with the toggle button.
      themeMode: themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
