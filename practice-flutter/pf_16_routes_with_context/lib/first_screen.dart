import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pf_16_routes_with_context/second_screen.dart';

class MyFirstScreen extends StatefulWidget {
  const MyFirstScreen({super.key});

  static String routeName = 'first';

  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  String name = "";

  TextEditingController nameController = TextEditingController();

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
              "Enter Data First Screen",
              style: GoogleFonts.outfit(color: Colors.black, fontSize: 20),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 60,
              child: TextField(
                controller: nameController,
                onChanged: (value) {
                  name = value;
                },
                style: GoogleFonts.outfit(color: Colors.black),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter your name",
                  hintStyle: GoogleFonts.outfit(color: Colors.black),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MySecondScreen(name: nameController.text),
                  ),
                );
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
