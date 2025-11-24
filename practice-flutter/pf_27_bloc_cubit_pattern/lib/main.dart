import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'toggle_cubit.dart';

void main() {
  // Entry point of the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide a single instance of ToggleCubit to the widget subtree
    return BlocProvider(
      create: (_) => ToggleCubit(),
      child: MaterialApp(
        title: 'Toggle Cubit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TogglePage(),
      ),
    );
  }
}

class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Cubit Example')),
      body: Center(
        // Rebuilds only this part of the UI when the ToggleCubit state changes
        child: BlocBuilder<ToggleCubit, bool>(
          builder: (context, isOn) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isOn ? Icons.lightbulb : Icons.lightbulb_outline,
                  size: 80,
                  color: isOn ? Colors.amber : Colors.grey,
                ),
                const SizedBox(height: 16),
                Text(
                  isOn ? 'Light is ON' : 'Light is OFF',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            );
          },
        ),
      ),
      // Tapping this button asks the ToggleCubit to flip the current state
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<ToggleCubit>().toggle(),
        label: const Text('Toggle'),
        icon: const Icon(Icons.power_settings_new),
      ),
    );
  }
}
