import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Buttons Widget App')),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () => log('Button Pressed'),
                child: const Text('Button'),
              ),
              ElevatedButton(
                onPressed: () => log('Elevated Button Pressed'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Elevated Button'),
              ),
              OutlinedButton(
                onPressed: () => log('Outlined Button Pressed'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Outlined Button'),
              ),
              IconButton(
                onPressed: () => log('Icon Button Pressed'),
                icon: const Icon(Icons.alarm),
                color: Colors.blue,
                iconSize: 60,
                splashColor: Colors.red,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => log('Floating Action Button Pressed'),
          child: const Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}
