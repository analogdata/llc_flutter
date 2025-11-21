import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: FutureBuilder<String?>(
        future: _getTextFromPrefs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            String? storedText = snapshot.data;

            if (storedText != null && storedText.isNotEmpty) {
              return SecondScreen();
            }
            return const MyHomePage(title: 'No data found');
          }
          return const MyHomePage(title: 'No data found');
        },
      ),
    );
  }
}

Future<String?> _getTextFromPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('stored_text');
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController entryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text("You're going to store data only one time"),
            Text("Press the button to navigate to the second screen"),
            TextField(
              controller: entryTextController,
              decoration: const InputDecoration(
                hintText: "Enter some text to store",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Store the text when button is pressed
                SharedPreferences.getInstance().then((prefs) {
                  prefs.setString('stored_text', entryTextController.text);
                });
              },
              child: const Text('Store Text'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        tooltip: 'Go to Second Screen',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
