import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pf_15_routes_by_id/second_screen.dart';

class MyFirstScreen extends StatelessWidget {
  static const String id = 'first';

  const MyFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "First Screen",
          style: GoogleFonts.outfit(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "First Screen",
              style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MySecondScreen.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyanAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Go to Second Screen",
                style: GoogleFonts.outfit(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
