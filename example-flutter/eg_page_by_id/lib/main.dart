import 'package:flutter/material.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';

void main() {
  runApp(PagesApp());
}

class PagesApp extends StatelessWidget {
  const PagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: FirstScreen(),
      initialRoute: FirstScreen.id,
      routes: {
        FirstScreen.id: (context) => FirstScreen(),
        SecondScreen.id: (context) => SecondScreen(),
      },
    );
  }
}
