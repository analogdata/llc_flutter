import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySecondScreen extends StatefulWidget {
  const MySecondScreen({super.key, required this.name});

  static String routeName = 'second';

  final String name;

  @override
  State<MySecondScreen> createState() => _MySecondScreenState();
}

class _MySecondScreenState extends State<MySecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Second Screen",
              style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20),

            Text(
              "Data Received from First Screen",
              style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "Name: ${widget.name}",
              style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
