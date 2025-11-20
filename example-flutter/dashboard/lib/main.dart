import 'package:dashboard/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const DashboardScreen(),
    );
  }
}
