import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pro_05_rest_api_with_shared_preferences/screens/login_screen.dart';
import 'package:pro_05_rest_api_with_shared_preferences/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder<String?>(
        future: _getStoredUsername(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final username = snapshot.data;

          if (username != null && username.isNotEmpty) {
            return HomeScreen(username: username);
          }

          return const LoginScreen(title: 'Login');
        },
      ),
    );
  }
}

Future<String?> _getStoredUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username');
}
