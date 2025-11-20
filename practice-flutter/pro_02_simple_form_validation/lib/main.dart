import 'package:flutter/material.dart';
import 'package:pro_02_simple_form_validation/pages/home_page.dart';

void main() {
  runApp(const SimpleFormValidation());
}

class SimpleFormValidation extends StatelessWidget {
  const SimpleFormValidation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Form Validation',
      theme: ThemeData(colorSchemeSeed: Colors.teal),
      home: const HomePage(),
    );
  }
}
