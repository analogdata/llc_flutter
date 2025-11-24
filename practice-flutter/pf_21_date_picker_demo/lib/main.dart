import 'package:flutter/material.dart';

void main() {
  // `runApp` takes the given widget and makes it the root of the widget tree.
  runApp(const MyApp());
}

/// Root widget of the application.
///
/// This simply sets up the app theme and tells Flutter to start from
/// the `DatePickerDemo` widget as the home page.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Picker Demo',
      theme: ThemeData(
        // Use a seeded color scheme for a modern look.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DatePickerDemo(),
    );
  }
}

/// Home screen that demonstrates how to use `showDatePicker`.
class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  // Holds the currently selected date.
  // `null` means the user has not picked any date yet.
  DateTime? _selectedDate;

  /// Helper method that opens the material date picker dialog.
  Future<void> _pickDate() async {
    final DateTime today = DateTime.now();

    // `showDatePicker` returns a `Future<DateTime?>` that completes
    // when the user either selects a date or cancels the dialog.
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      // Initial date shown when the picker opens.
      initialDate: _selectedDate ?? today,
      // Earliest date the user can select.
      firstDate: DateTime(2000),
      // Latest date the user can select.
      lastDate: DateTime(2100),
      helpText: 'Select a booking date',
      cancelText: 'CANCEL',
      confirmText: 'OK',
    );

    // If the user pressed "OK" (did not cancel), update the state
    // so the UI shows the newly selected date.
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  /// Formats the selected date into a human-readable string.
  String get _selectedDateText {
    if (_selectedDate == null) {
      return 'No date selected yet';
    }

    // Simple manual formatting: DD/MM/YYYY.
    final day = _selectedDate!.day.toString().padLeft(2, '0');
    final month = _selectedDate!.month.toString().padLeft(2, '0');
    final year = _selectedDate!.year.toString();

    return '$day/$month/$year';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Date Picker Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text that displays the currently selected date.
              Text(
                _selectedDateText,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Elevated button that opens the date picker dialog.
              ElevatedButton.icon(
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today),
                label: const Text('Select Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
