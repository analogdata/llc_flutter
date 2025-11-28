# Vibration Demo App

This Flutter application demonstrates how to trigger different vibration patterns on a mobile device.

## Features

- Check for device vibration support.
- Check for custom vibration support (amplitude control).
- Triggers different vibration types:
  - **Light Impact**: Low amplitude vibration (if supported).
  - **Heavy Impact**: High amplitude vibration.
  - **Success**: Short pulse.
  - **Error**: Double pulse pattern.
  - **Warning**: Long pulse pattern.
  - **Heartbeat**: Rythmic pattern.

## Requirements

- A physical Android or iOS device (Simulators often do not support vibration).
- Android: Requires `android.permission.VIBRATE` (already added to `AndroidManifest.xml`).

## Dependencies

- [vibration](https://pub.dev/packages/vibration)

## How to Run

1. Connect your physical device.
2. Run `flutter run`.
