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
      title: 'Images App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Image App'), centerTitle: true),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 100,
                width: 100,
              ),
              Text(
                "Analog Data",
                style: TextStyle(fontSize: 20, letterSpacing: 0.5),
              ),
              Image(
                image: NetworkImage(
                  "https://storage.googleapis.com/cms-storage-bucket/lockup_flutter_horizontal.c823e53b3a1a7b0d36a9.png",
                ),
                height: 100,
                width: 100,
              ),
              Icon(Icons.flutter_dash, size: 100),
              Icon(Icons.alarm, size: 100, color: Colors.orangeAccent),
            ],
          ),
        ),
      ),
    );
  }
}
