import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This is our simple user model that holds the username.
// It extends ChangeNotifier so that it can notify listeners (widgets)
// whenever its data changes.
class UserProvider extends ChangeNotifier {
  String _username = '';

  // Public getter that widgets will use to read the username.
  String get username => _username;

  // Public method to update the username.
  // After changing the value, we call notifyListeners() so that
  // any listening widgets rebuild with the new data.
  void setUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }
}

void main() {
  // ChangeNotifierProvider makes UserProvider available
  // to the entire widget tree below MyApp.
  runApp(
    ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const UsernameScreen(),
    );
  }
}

// A super simple screen where the user can type a username
// and see the saved value below.
class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // We can read the provider in two ways:
    // 1. context.read<UserProvider>()  -> only to call methods (no rebuilds)
    // 2. context.watch<UserProvider>() -> to listen for changes (rebuilds)
    return Scaffold(
      appBar: AppBar(title: const Text('Username (Provider Example)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your username:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type a username',
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Here we only want to call a method on the provider,
                  // we do NOT need to rebuild this widget directly.
                  // So we use read<UserProvider>().
                  context.read<UserProvider>().setUsername(_controller.text);
                },
                child: const Text('Save username'),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Current saved username:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            // This Text should update whenever username changes.
            // We use context.watch<UserProvider>() so that this part of the
            // widget tree listens to changes and rebuilds automatically.
            Consumer<UserProvider>(
              builder: (context, userProvider, _) {
                // If no username set yet, show a friendly message.
                if (userProvider.username.isEmpty) {
                  return const Text(
                    'No username saved yet.',
                    style: TextStyle(color: Colors.grey),
                  );
                }

                return Text(
                  userProvider.username,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
