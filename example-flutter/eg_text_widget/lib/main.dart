import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:developer';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Text Widget",
            style: GoogleFonts.outfit(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: IconButton(
            onPressed: () => log("I love flutter"),
            icon: Icon(Icons.favorite, size: 100, color: Colors.red),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => log("Floating action button pressed"),
          child: Icon(Icons.chat, size: 32),
        ),
      ),
    );
  }
}
