import 'package:flutter/material.dart';
import 'package:pf_14_routes/second_screen.dart';
import 'first_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // home: MyFirstScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyFirstScreen(),
        '/second': (context) => MySecondScreen(),
      },
    ),
  );
}
