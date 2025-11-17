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
      title: 'List Tile Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "List Tile Widget Demo",
            style: GoogleFonts.outfit(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent,
        ),
        body: ListTile(
          leading: Icon(Icons.home, color: Colors.black, size: 36),
          title: Text("Home", style: GoogleFonts.outfit(color: Colors.black)),
          subtitle: Text(
            "No Better Place than 127.0.0.1",
            style: GoogleFonts.outfit(color: Colors.black),
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              log("Home");
            },
          ),
        ),
      ),
    );
  }
}
