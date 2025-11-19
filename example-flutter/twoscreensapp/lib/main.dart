import 'package:flutter/material.dart';
import 'package:twoscreensapp/first_screen.dart';
import 'package:twoscreensapp/second_screen.dart';

void main() {
  runApp(MaterialApp(

    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/second': (context) => Second(),
    },
  ));
}
