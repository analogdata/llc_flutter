import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gyroscope Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const GyroscopePage(),
    );
  }
}

class GyroscopePage extends StatefulWidget {
  const GyroscopePage({super.key});

  @override
  State<GyroscopePage> createState() => _GyroscopePageState();
}

class _GyroscopePageState extends State<GyroscopePage> {
  // Raw Gyroscope values (Angular Velocity in rad/s)
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;

  // Calculated Orientation (Integrated angles in degrees)
  // Note: Pure gyroscope integration leads to drift over time.
  double _pitch = 0.0;
  double _roll = 0.0;
  double _yaw = 0.0;

  StreamSubscription<GyroscopeEvent>? _gyroSubscription;
  int? _lastTimestamp;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() {
    // Sensors_plus docs say events come as fast as possible.
    // We'll approximate delta time for integration.
    // On Android/iOS, typical rate might be 50Hz-100Hz but it varies.
    // A robust app uses a Ticker or relies on event timestamps if available/reliable.
    // The GyroscopeEvent doesn't expose a timestamp directly in the simple view,
    // but let's assume a rough dt or use a stopwatch.

    DateTime lastUpdate = DateTime.now();

    _gyroSubscription = gyroscopeEventStream().listen((GyroscopeEvent event) {
      final now = DateTime.now();
      // Calculate time delta in seconds
      final dt = now.difference(lastUpdate).inMicroseconds / 1000000.0;
      lastUpdate = now;

      setState(() {
        _x = event.x;
        _y = event.y;
        _z = event.z;

        // Integrate angular velocity to get angle
        // angle = angle + (velocity * dt)
        // Converting to degrees for display: rad * (180/pi)

        // X-axis rotation -> Pitch
        _pitch += event.x * dt * (180 / pi);

        // Y-axis rotation -> Roll
        _roll += event.y * dt * (180 / pi);

        // Z-axis rotation -> Yaw
        _yaw += event.z * dt * (180 / pi);
      });
    });
  }

  void _resetOrientation() {
    setState(() {
      _pitch = 0.0;
      _roll = 0.0;
      _yaw = 0.0;
    });
  }

  @override
  void dispose() {
    _gyroSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gyroscope Access'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetOrientation,
            tooltip: 'Reset Orientation',
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Raw Gyroscope Values',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '(Angular Velocity in rad/s)',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              _buildSensorCard('X Axis', _x, Colors.red),
              _buildSensorCard('Y Axis', _y, Colors.green),
              _buildSensorCard('Z Axis', _z, Colors.blue),

              const Divider(height: 32, thickness: 2),

              const Text(
                'Calculated Orientation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                '(Integrated from Gyro - Subject to Drift)',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              _buildSensorCard(
                'Pitch (X-rot)',
                _pitch,
                Colors.orange,
                unit: '°',
              ),
              _buildSensorCard('Roll (Y-rot)', _roll, Colors.purple, unit: '°'),
              _buildSensorCard('Yaw (Z-rot)', _yaw, Colors.teal, unit: '°'),

              const SizedBox(height: 20),
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Tip: Move the phone to see values change. Press reset if values drift too much.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSensorCard(
    String label,
    double value,
    Color color, {
    String unit = ' rad/s',
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color.withOpacity(0.5), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
            Text(
              '${value.toStringAsFixed(2)}$unit',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
