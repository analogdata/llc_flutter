import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const Contact());
  }
}

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  String name = 'Rajath';
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Page'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            Text(name),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = _nameController.text;
                });
              },
              child: const Text('Change Name'),
            ),
          ],
        ),
      ),
    );
  }
}
