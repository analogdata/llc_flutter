# Gyroscope Access in Flutter

This project demonstrates how to access the device's gyroscope sensor using the `sensors_plus` package in Flutter. It displays raw angular velocity values and calculates approximate orientation (Pitch, Roll, Yaw) through integration.

## 📚 Theory: How it Works

### What is a Gyroscope?
A gyroscope is a sensor that measures **orientation** and **angular velocity**. Modern smartphones use **MEMS** (Micro-Electro-Mechanical Systems) gyroscopes. Unlike an accelerometer, which measures linear acceleration (change in speed), a gyroscope measures the rate of rotation around an axis.

### The 3 Axes
The gyroscope measures rotation around three principal axes relative to the device's screen:

1.  **X-Axis (Pitch):** Runs horizontally across the screen (left to right). Rotation around this axis happens when you tilt the phone forward or backward.
2.  **Y-Axis (Roll):** Runs vertically up the screen (bottom to top). Rotation around this axis happens when you tilt the phone side-to-side.
3.  **Z-Axis (Yaw):** Runs perpendicular to the screen (out of the front). Rotation around this axis happens when you spin the phone flat on a table.

### Angular Velocity
The raw data returned by the gyroscope is **Angular Velocity**, usually measured in **radians per second (rad/s)**.
*   If the phone is stationary, values are near 0.
*   If you rotate the phone quickly, the values increase.
*   The value represents *how fast* the angle is changing, not the current angle itself.

### From Velocity to Angle (Integration)
To get the actual angle (Position) from Angular Velocity, we must perform mathematical **integration**:
$$ \text{Angle} = \int \text{Velocity} \, dt $$

In code, we approximate this by adding the change over small time steps:
`Current Angle = Previous Angle + (Velocity × Time_Delta)`

> **Note on Drift:** Gyroscopes are prone to "drift". Small errors in velocity measurement add up over time during integration, causing the calculated angle to slowly wander even when the device is still. In professional apps, this is corrected using "Sensor Fusion" (combining Gyroscope with Accelerometer and Magnetometer).

---

## 🛠️ Code Explanation

### 1. Dependencies
We use the `sensors_plus` package to access the hardware sensors.
```yaml
dependencies:
  sensors_plus: ^5.0.0
```

### 2. Accessing the Stream
The sensor data is provided as a Dart `Stream`. We listen to this stream to get real-time updates.

```dart
import 'package:sensors_plus/sensors_plus.dart';

// ... inside your State class
StreamSubscription<GyroscopeEvent>? _gyroSubscription;

@override
void initState() {
  super.initState();
  // Listen to the stream
  _gyroSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
    // event.x, event.y, event.z contain the angular velocity
    setState(() {
      _x = event.x;
      _y = event.y;
      _z = event.z;
    });
  });
}
```

### 3. Calculating Pitch, Roll, and Yaw
Inside the listener, we calculate the time difference (`dt`) between events and integrate the values.

```dart
// Calculate time passed since last event
final dt = now.difference(lastUpdate).inMicroseconds / 1000000.0;

// Integrate: Angle += Velocity * Time
// Multiplied by (180 / pi) to convert Radians to Degrees
_pitch += event.x * dt * (180 / pi);
_roll += event.y * dt * (180 / pi);
_yaw += event.z * dt * (180 / pi);
```

### 4. Cleanup
Always cancel the stream subscription when the widget is disposed to prevent memory leaks.

```dart
@override
void dispose() {
  _gyroSubscription?.cancel();
  super.dispose();
}
```

## 🚀 How to Run

1.  **Connect a physical device** (Simulators often do not simulate gyroscope data accurately).
2.  Run the app:
    ```bash
    flutter run
    ```
3.  Move the phone around to see the X, Y, Z velocity values change.
4.  Observe the Pitch, Roll, and Yaw angles updating.
5.  Use the **Reset** button in the app bar if the angles drift too far.
