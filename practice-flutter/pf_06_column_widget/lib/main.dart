import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Column Widget',
            style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Dart & Flutter',
                style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Icon(Icons.flutter_dash_rounded, size: 150, color: Colors.black),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  log("Hello Developer!");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                child: Text(
                  'I\'m Developer',
                  style: GoogleFonts.outfit(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
