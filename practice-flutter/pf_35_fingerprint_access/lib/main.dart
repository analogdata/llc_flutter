import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fingerprint Access',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FingerprintScreen(),
    );
  }
}

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authenticated';
  bool _isAuthenticating = false;

  @override
  void dispose() {
    auth.stopAuthentication();
    super.dispose();
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });

      // Check if device supports biometrics and if any are enrolled
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool isDeviceSupported = await auth.isDeviceSupported();

      if (!canAuthenticateWithBiometrics && !isDeviceSupported) {
        setState(() {
          _isAuthenticating = false;
          _authorized = 'Device not supported';
        });
        return;
      }

      final List<BiometricType> availableBiometrics = await auth
          .getAvailableBiometrics();

      if (availableBiometrics.isEmpty) {
        setState(() {
          _isAuthenticating = false;
          _authorized = 'No Biometrics Enrolled';
        });
        return;
      }

      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        // stickyAuth: true,
        biometricOnly: true,
      );
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _authorized = 'Error - ${e.message}';
        _isAuthenticating = false;
      });
      return;
    }

    if (!mounted) return;

    setState(() {
      _isAuthenticating = false;
      _authorized = authenticated ? 'Authorized' : 'Un Authorized';
    });
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.grey;
    if (_authorized == 'Authorized') {
      statusColor = Colors.green;
    } else if (_authorized == 'Un Authorized') {
      statusColor = Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Auth'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.fingerprint,
                size: 100,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              Text(
                'Authentication Status:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Text(
                _authorized,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              FilledButton.icon(
                onPressed: _isAuthenticating ? null : _authenticate,
                icon: const Icon(Icons.lock_open),
                label: const Text('Authenticate Now'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
