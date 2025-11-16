import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text(
          'Stateless Widget is a widget that does not change over time.',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
