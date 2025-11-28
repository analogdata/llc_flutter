# Fingerprint Access Application

A simple Flutter application that demonstrates how to use native biometric authentication (Fingerprint/Face ID) to authorize users.

## Features

- Checks for biometric hardware support.
- Authenticates the user using the device's native biometric prompt.
- Displays "Authorized" upon success and "Un Authorized" upon failure.

## Prerequisites

- Flutter SDK
- Android Device/Emulator with Fingerprint support (Setup Security settings in emulator).
- iOS Device/Simulator (For Simulator, enable FaceID in features).

## Dependencies

This project uses the `local_auth` package.

```yaml
dependencies:
  local_auth: ^3.0.0
```

## Setup Guide

### Android Setup

1.  **Permissions**: The `android.permission.USE_BIOMETRIC` permission is added to `android/app/src/main/AndroidManifest.xml`.
2.  **Activity**: The main activity is updated to extend `FlutterFragmentActivity` instead of `FlutterActivity`. This is required by the `local_auth` plugin to display the biometric prompt correctly.

    File: `android/app/src/main/kotlin/com/example/pf_35_fingerprint_access/MainActivity.kt`

    ```kotlin
    import io.flutter.embedding.android.FlutterFragmentActivity

    class MainActivity: FlutterFragmentActivity()
    ```

### iOS Setup

1.  **Info.plist**: The `NSFaceIDUsageDescription` key is added to `ios/Runner/Info.plist`. This provides the reason for accessing FaceID which is displayed to the user.

    ```xml
    <key>NSFaceIDUsageDescription</key>
    <string>We use Face ID for secure authentication</string>
    ```

## How It Works

The application logic is contained in `lib/main.dart`.

1.  **Initialization**: We create an instance of `LocalAuthentication`.
2.  **Check Support**: Before authenticating, we check if the device supports biometrics using `auth.canCheckBiometrics` and `auth.isDeviceSupported()`.
3.  **Authentication**: The `_authenticate()` method is called when the button is pressed.
    -   It calls `auth.authenticate()` with `biometricOnly: true`.
    -   The result is a boolean (`true` if successful, `false` otherwise).
4.  **UI Update**: Based on the boolean result, the UI updates the text to show either "Authorized" (Green) or "Un Authorized" (Red).

## Usage

1.  Run the app on a device/emulator.
2.  Click the "Authenticate Now" button.
3.  Provide your fingerprint (or Face ID).
    -   **On Android Emulator**: Use the extended controls (three dots) -> Fingerprint -> Touch the sensor.
    -   **On iOS Simulator**: Features -> Face ID -> Enrolled, then Match/Non-matching.
4.  Observe the status change.
