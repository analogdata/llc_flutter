import 'package:flutter/material.dart';

void main() {
  runApp(TabDemo());
}

class TabDemo extends StatelessWidget {
  const TabDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tab Demo'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.business)),
                Tab(icon: Icon(Icons.school)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Home Tab')),
              Center(child: Text('Business Tab')),
              Center(child: Text('School Tab')),
              Center(child: Text('Settings Tab')),
            ],
          ),
          drawer: Drawer(child: ListView(children: [Icon(Icons.abc)])),
          bottomNavigationBar: BottomNavigationBar(
            // currentIndex: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
