import 'package:flutter/material.dart';
import 'package:pro_01_responsive_layout/screens/layout_home_screens.dart';

void main() {
  runApp(const ResponsiveLayout());
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: HomeScreenLayout(),
    );
  }
}
