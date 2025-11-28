import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const VibrationDemoApp());
}

class VibrationDemoApp extends StatelessWidget {
  const VibrationDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibration Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const VibrationHomePage(),
    );
  }
}

class VibrationHomePage extends StatefulWidget {
  const VibrationHomePage({super.key});

  @override
  State<VibrationHomePage> createState() => _VibrationHomePageState();
}

class _VibrationHomePageState extends State<VibrationHomePage> {
  bool? _hasVibrator;
  bool? _hasCustomVibrationsSupport;

  @override
  void initState() {
    super.initState();
    _checkVibrationCapabilities();
  }

  Future<void> _checkVibrationCapabilities() async {
    bool hasVibrator = await Vibration.hasVibrator() ?? false;
    bool hasCustomVibrationsSupport =
        await Vibration.hasCustomVibrationsSupport() ?? false;

    if (mounted) {
      setState(() {
        _hasVibrator = hasVibrator;
        _hasCustomVibrationsSupport = hasCustomVibrationsSupport;
      });
    }
  }

  void _vibrateHeavy() {
    if (_hasVibrator == true) {
      if (_hasCustomVibrationsSupport == true) {
        Vibration.vibrate(duration: 500, amplitude: 255);
      } else {
        Vibration.vibrate(duration: 500);
      }
    }
  }

  void _vibrateLight() {
    if (_hasVibrator == true) {
      if (_hasCustomVibrationsSupport == true) {
        Vibration.vibrate(duration: 500, amplitude: 64);
      } else {
        Vibration.vibrate(duration: 500);
      }
    }
  }

  void _vibrateSuccess() {
    if (_hasVibrator == true) {
      Vibration.vibrate(duration: 50);
    }
  }

  void _vibrateError() {
    if (_hasVibrator == true) {
      // Pattern: wait 0ms, vibrate 100ms, wait 100ms, vibrate 100ms
      Vibration.vibrate(pattern: [0, 100, 100, 100]);
    }
  }

  void _vibrateWarning() {
    if (_hasVibrator == true) {
      // Pattern: wait 0ms, vibrate 400ms, wait 200ms, vibrate 400ms
      Vibration.vibrate(pattern: [0, 400, 200, 400]);
    }
  }

  void _vibrateHeartbeat() {
    if (_hasVibrator == true) {
      // Pattern: wait 0ms, vibrate 150ms, wait 100ms, vibrate 150ms
      Vibration.vibrate(pattern: [0, 150, 100, 150]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibration Patterns'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: _hasVibrator == null
            ? const CircularProgressIndicator()
            : _hasVibrator == false
            ? const Text('This device does not support vibration.')
            : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if (_hasCustomVibrationsSupport == true)
                      const Text(
                        'Custom Vibration Support: YES',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else
                      const Text(
                        'Custom Vibration Support: NO (Standard only)',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 30),
                    _VibrateButton(
                      label: 'Light Impact',
                      onPressed: _vibrateLight,
                      icon: Icons.touch_app_outlined,
                      color: Colors.lightBlue,
                    ),
                    const SizedBox(height: 16),
                    _VibrateButton(
                      label: 'Heavy Impact',
                      onPressed: _vibrateHeavy,
                      icon: Icons.touch_app,
                      color: Colors.blue.shade900,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    _VibrateButton(
                      label: 'Success',
                      onPressed: _vibrateSuccess,
                      icon: Icons.check_circle,
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    _VibrateButton(
                      label: 'Error (Double Pulse)',
                      onPressed: _vibrateError,
                      icon: Icons.error,
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 16),
                    _VibrateButton(
                      label: 'Warning (Long Pulses)',
                      onPressed: _vibrateWarning,
                      icon: Icons.warning,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 16),
                    _VibrateButton(
                      label: 'Heartbeat Pattern',
                      onPressed: _vibrateHeartbeat,
                      icon: Icons.favorite,
                      color: Colors.pink,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _VibrateButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  final Color textColor;

  const _VibrateButton({
    required this.label,
    required this.onPressed,
    required this.icon,
    required this.color,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
        ),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
