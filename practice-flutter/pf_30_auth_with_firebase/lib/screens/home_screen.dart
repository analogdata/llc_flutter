import 'package:flutter/material.dart';
import 'profile_screen.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _authService = AuthService();
  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();
    _checkEmailVerification();
  }

  Future<void> _checkEmailVerification() async {
    await _authService.reloadUser();
    setState(() {
      _isEmailVerified = _authService.currentUser?.emailVerified ?? false;
    });
  }

  final List<Widget> _pages = [
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text('Home Dashboard', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.explore, size: 100, color: Colors.green),
          SizedBox(height: 16),
          Text('Explore', style: TextStyle(fontSize: 24)),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (!_isEmailVerified)
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.warning),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Email not verified.')),
                  TextButton(
                    onPressed: () async {
                      await _authService.sendEmailVerification();
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Verification email sent'),
                          ),
                        );
                      }
                    },
                    child: const Text('Resend'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: _checkEmailVerification,
                  ),
                ],
              ),
            ),
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        ],
      ),
    );
  }
}
