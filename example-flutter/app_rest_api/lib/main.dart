import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST Example',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _datafromserver = '';
  int _result = 0;

  int _number1 = 20;
  int _number2 = 30;

  Future<void> _fetchData() async {
    setState(() {
      _datafromserver = '';
    });

    final response = await http.get(Uri.parse('http://10.0.2.2:8000/'));
    if (response.statusCode == 200) {
      setState(() {
        _datafromserver = json.decode(response.body)['Hello'];
      });
    } else {
      setState(() {
        _datafromserver = 'Failed to load data';
      });
    }
  }

  Future<void> _postData() async {
    setState(() {
      _datafromserver = '';
    });

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/multiply'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'a': _number1, 'b': _number2}),
    );
    if (response.statusCode == 200) {
      log(response.body);
      setState(() {
        _result = json.decode(response.body)['result'];
        log(_result.toString());
      });
    } else {
      setState(() {
        _result = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number 1',
                ),
                onChanged: (value) {
                  setState(() {
                    _number1 = int.parse(value);
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number 2',
                ),
                onChanged: (value) {
                  setState(() {
                    _number2 = int.parse(value);
                  });
                },
              ),
              ElevatedButton(
                onPressed: _postData,
                child: const Text('Post Method'),
              ),
              Text('Result:'),
              Text(
                'Result is: $_result',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              const Text('Data from server:'),
              Text(
                'Data is: $_datafromserver',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchData,
        tooltip: 'Fetch Data',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
