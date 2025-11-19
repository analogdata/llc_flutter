import 'package:flutter/material.dart';

import 'package:pf_15_routes_by_id/first_screen.dart';
import 'package:pf_15_routes_by_id/second_screen.dart';
import 'package:pf_15_routes_by_id/third_screen.dart';

void main() {
  runApp(
    MaterialApp(
      // home: MyFirstScreen(),
      initialRoute: MyFirstScreen.id,
      routes: {
        MyFirstScreen.id: (context) => MyFirstScreen(),
        MySecondScreen.id: (context) => MySecondScreen(),
        MyThirdScreen.id: (context) => MyThirdScreen(),
      },
    ),
  );
}
