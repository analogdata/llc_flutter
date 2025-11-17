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
      title: 'Container Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Container Widget',
            style: GoogleFonts.outfit(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent,
        ),
        body: Container(
          color: Colors.blueAccent,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          height: 140,
          child: Column(
            children: [
              Text(
                'Dart & Flutter',
                style: GoogleFonts.outfit(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Best Hybrid App Development Platform',
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
