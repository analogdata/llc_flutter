import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authService = AuthService();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Change Password'),
        content: TextField(
          controller: _passwordController,
          decoration: const InputDecoration(labelText: 'New Password'),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (_passwordController.text.isNotEmpty) {
                Navigator.pop(dialogContext);
                setState(() => _isLoading = true);
                try {
                  await _authService.updatePassword(_passwordController.text);
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password updated successfully'),
                      ),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error: $e')));
                  }
                } finally {
                  if (mounted) {
                    setState(() => _isLoading = false);
                    _passwordController.clear();
                  }
                }
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  Future<void> _logout() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.pop(
        context,
      ); // Return to previous screen (which might be home, but auth stream will handle redirect)
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 80),
                  const SizedBox(height: 16),
                  Text(
                    'Email: ${user?.email ?? 'Unknown'}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: _changePassword,
                    icon: const Icon(Icons.lock),
                    label: const Text('Change Password'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _logout,
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade100,
                      foregroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
