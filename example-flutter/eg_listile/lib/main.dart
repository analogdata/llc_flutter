import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListTile Example")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.toys),
              title: Text("Mickey Mouse"),
              subtitle: Text("mickeymouse@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rajath"),
              subtitle: Text("Rajathkumar@gmail.com"),
              trailing: IconButton(
                onPressed: () {
                  log("call");
                },
                icon: Icon(Icons.call),
              ),
              onTap: () {
                log("Rajath");
              },
            ),
          ],
        ),
      ),
    );
  }
}
