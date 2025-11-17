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
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Text Field Widget',
            style: GoogleFonts.outfit(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent,
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: TextField(
            style: GoogleFonts.outfit(fontSize: 16),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              labelText: 'Name',
              labelStyle: GoogleFonts.outfit(fontSize: 16),
              prefixIcon: Icon(Icons.person),
              contentPadding: EdgeInsets.all(12.0),
            ),
            onChanged: (value) {
              log(value);
            },
          ),
        ),
      ),
    );
  }
}
