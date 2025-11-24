import 'package:flutter/material.dart';

import 'views/weather_page.dart';

void main() {
  // Entry point of the Flutter application.
  runApp(const MyApp());
}

/// Root widget of the app.
///
/// In MVVM terms, this only sets up global app
/// configuration (theme, title, routes) and decides
/// which View is shown first. The MVVM layers are
/// implemented inside WeatherPage and the files it uses.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Weather Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WeatherPage(),
    );
  }
}
