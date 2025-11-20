import 'package:flutter/material.dart';
import 'package:eg_page_by_id/screens/first_screen.dart';

class SecondScreen extends StatefulWidget {
  static const String id = 'second_screen';

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          children: [
            Text('Second Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FirstScreen.id);
              },
              child: Text('Go to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
