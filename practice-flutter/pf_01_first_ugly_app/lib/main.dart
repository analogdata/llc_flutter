import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'First Ugly App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'First Ugly App',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Text(
            'I\'ll Learn Flutter in 10 Days',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log('Button Pressed');
          },
          backgroundColor: Colors.yellow,
          child: Text('+', style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
      ),
    ),
  );
}
