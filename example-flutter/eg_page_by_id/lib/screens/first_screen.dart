import 'package:eg_page_by_id/screens/second_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  static const String id = 'first_screen';

  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: Column(
          children: [
            Text('First Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SecondScreen.id);
              },
              child: Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
