import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/counter_bloc.dart';

// Entry point of the app. We keep it very small and delegate UI to MyApp.
void main() {
  runApp(const MyApp());
}

// Root widget for the app.
// Provides CounterBloc to the widget tree using BlocProvider.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: called once; here we create our CounterBloc.
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Bloc Counter Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(),
      ),
    );
  }
}

// Simple page that shows the current counter value and a button to increment.
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Counter')),
      body: Center(
        // BlocBuilder listens to CounterBloc and rebuilds when the int state changes.
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When pressed, we add an event to the Bloc instead of calling setState.
        onPressed: () {
          context.read<CounterBloc>().add(CounterIncrementPressed());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
