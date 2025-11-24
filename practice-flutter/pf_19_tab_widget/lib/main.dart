import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Simple Flutter app demonstrating a TabBar + TabBarView setup.
///
/// The main ideas:
/// - Wrap the home widget in a DefaultTabController to manage tab state.
/// - Use an AppBar with a TabBar in the bottom to show the tabs.
/// - Use a TabBarView in the body to show the content for each tab.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TabExample(),
    );
  }
}

/// Root screen that holds the tab bar and tab views.
///
/// [DefaultTabController]
/// -----------------------
/// It creates and manages a TabController for us.
/// We just need to specify how many tabs we have using `length`.
/// All widgets below it in the tree (TabBar and TabBarView) will use
/// this same controller to stay in sync.
class TabExample extends StatelessWidget {
  const TabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Number of tabs in this example.
      length: 3,
      // The child is usually a Scaffold so we get an AppBar + body.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Widget Example'),
          bottom: const TabBar(
            // Each Tab here represents one tab in the bar.
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
            ],
          ),
        ),
        // TabBarView shows the content for the *selected* tab.
        // It must have the same number of children as the TabBar has tabs.
        body: const TabBarView(
          children: [
            // Content of tab 1
            Center(
              child: Text('Home Tab Content', style: TextStyle(fontSize: 24)),
            ),
            // Content of tab 2
            Center(
              child: Text(
                'Favorites Tab Content',
                style: TextStyle(fontSize: 24),
              ),
            ),
            // Content of tab 3
            Center(
              child: Text(
                'Settings Tab Content',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
