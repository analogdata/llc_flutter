import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = "";
  String password = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Building the widget");
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "email",
                hintText: "Enter your email",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "password",
                hintText: "Enter your password",
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                  // emailController.clear();
                });
              },
              child: Text("Submit"),
            ),
            Text(email),
          ],
        ),
      ),
    );
  }
}
