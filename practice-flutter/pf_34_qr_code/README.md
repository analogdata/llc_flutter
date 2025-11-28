# PF 34 QR Code Reader Sample

This is a simple Flutter application that demonstrates how to scan QR codes and display the scanned data.

## Features

- Scan QR codes using the device camera.
- Display the raw string data from the scanned QR code.
- Simple and clean UI.

## Dependencies

This project uses the following package:
- [mobile_scanner](https://pub.dev/packages/mobile_scanner)

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / Xcode (for mobile development)

### Setup

1. **Clone or Open the project**
   Navigate to the project directory.

2. **Install Dependencies**
   Run the following command to install the required packages:
   ```bash
   flutter pub get
   ```

### Platform Specific Configuration

#### iOS
The `Info.plist` file has been updated to include the `NSCameraUsageDescription` key, which is required to access the camera.

#### Android
The `minSdkVersion` should be at least 21. If you encounter build errors related to SDK version, please check `android/app/build.gradle`.

### Running the App

Connect your device or start an emulator (Note: Camera might not work on all simulators/emulators).

```bash
flutter run
```

## How to Use

1. Open the app.
2. Tap the "Scan QR Code" button.
3. Point the camera at a QR code.
4. The app will return to the home screen and display the content of the QR code.
