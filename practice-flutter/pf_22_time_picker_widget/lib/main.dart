import 'package:flutter/material.dart';

void main() {
  // Entry point of the application.
  // It runs the root widget `MyApp`.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Picker Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // The home screen of the app is our custom `TimePickerDemo` widget.
      home: const TimePickerDemo(),
    );
  }
}

// A simple screen that demonstrates how to use Flutter's built-in time picker.
class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  // Holds the currently selected time.
  // `TimeOfDay` is a Flutter class that represents a time without a date.
  TimeOfDay? _selectedTime;

  // This method opens the material time picker dialog and waits for the user
  // to pick a time. Once the user picks a time (and does not cancel), we
  // update the state so the UI shows the new value.
  Future<void> _pickTime() async {
    final TimeOfDay now = TimeOfDay.now();

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      // `initialTime` is the time that will be preselected when the dialog opens.
      initialTime: _selectedTime ?? now,
    );

    // If the user presses "OK", `pickedTime` will be non-null.
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Time Picker Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Informational text explaining what this screen does.
              const Text(
                'Tap the button below to pick a time.\n'
                'The selected time will be shown here.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // This text shows the currently selected time, or a message if
              // no time has been chosen yet.
              Text(
                _selectedTime == null
                    ? 'No time selected yet'
                    : 'Selected time: ${_selectedTime!.format(context)}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 24),

              // Button that triggers the time picker dialog.
              ElevatedButton.icon(
                onPressed: _pickTime,
                icon: const Icon(Icons.access_time),
                label: const Text('Pick Time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
