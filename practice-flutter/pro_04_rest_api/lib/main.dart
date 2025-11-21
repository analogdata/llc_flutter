import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  String _response = '';
  bool _loading = false;

  Future<void> _fetchApi() async {
    setState(() {
      _loading = true;
      _response = '';
    });

    try {
      final res = await http.get(Uri.parse('http://10.0.2.2:8000/'));
      setState(() {
        _response = res.statusCode == 200
            ? res.body
            : 'Error: \\${res.statusCode}';
      });
    } catch (e) {
      setState(() {
        _response = 'Request failed: \\${e.toString()}';
      });
    } finally {
      setState(() {
        _loading = false;
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
        child: Column(
          mainAxisAlignment: .center,
          children: [
            if (_loading) const CircularProgressIndicator(),
            if (!_loading && _response.isEmpty)
              const Text('Press the button to load data.'),
            if (_response.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_response, textAlign: TextAlign.center),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchApi,
        tooltip: 'Fetch',
        child: const Icon(Icons.cloud_download),
      ),
    );
  }
}
