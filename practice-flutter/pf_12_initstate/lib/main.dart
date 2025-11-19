import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INIT State Demo',
      home: const MyHomePage(title: 'INIT State Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.username = 'Guest'});

  final String title;
  final String username;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String? name;

  @override
  void initState() {
    super.initState();
    name = widget.username;
    log('initState');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      log("Build State");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text(
          '${widget.title} - $name',
          style: GoogleFonts.outfit(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              'You have pushed the button this many times:',
              style: GoogleFonts.outfit(color: Colors.black),
            ),
            Text(
              '$_counter',
              style: GoogleFonts.outfit(color: Colors.black, fontSize: 24),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
