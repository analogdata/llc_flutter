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
            "Row Widget Demo",
            style: GoogleFonts.outfit(color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.yellowAccent,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  log("Home");
                },
                icon: Icon(Icons.home),
                color: Colors.black,
                iconSize: 40,
                highlightColor: Colors.greenAccent,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  log("Search");
                },
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize: 40,
                highlightColor: Colors.greenAccent,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed: () {
                  log("Notifications");
                },
                icon: Icon(Icons.notifications),
                color: Colors.black,
                iconSize: 40,
                highlightColor: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
