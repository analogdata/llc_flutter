import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  static const String id = 'second_screen';

  const SecondScreen({super.key, required this.name});
  final String name;
  final String age = '32';

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
            Text("Hello ${widget.name}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
