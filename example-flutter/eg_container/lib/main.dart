import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment:
           MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellowAccent,
              height: 100,
              width: 100,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.home, size: 50, color: Colors.black),
              ),
            ),
            SizedBox(width: 20),
            Container(
              color: Colors.yellowAccent,
              height: 100,
              width: 100,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.business, size: 50, color: Colors.black),
              ),
            ),
            SizedBox(width: 20),
            Container(
              color: Colors.yellowAccent,
              height: 100,
              width: 100,
              padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(50, 10, 10, 10),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.school, size: 50, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
