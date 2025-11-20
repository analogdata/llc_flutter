import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: MyFirstScreen.routeName,
      routes: {
        MyFirstScreen.routeName: (context) => const MyFirstScreen(),
        MySecondScreen.routeName: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return MySecondScreen(name: args ?? "");
        },
      },
    );
  }
}
