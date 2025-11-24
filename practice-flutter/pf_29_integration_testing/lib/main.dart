import 'package:flutter/material.dart';

void main() {
  // Entry point of the app that we will drive from an integration test.
  runApp(const MyApp());
}

// A very small app designed specifically for integration testing examples.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

/// A simple counter screen that our integration test will interact with.
///
/// The integration test will:
///  1. Launch the app.
///  2. Verify that the initial counter text is "0".
///  3. Tap the FloatingActionButton once.
///  4. Verify that the counter text changes to "1".
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Integration Test')),
      body: Center(
        child: Text(
          '$_counter',
          key: const Key('counter_text'), // Used by the integration test.
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment_button'), // Used by the integration test.
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
