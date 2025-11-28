# Map Location Access App

A Flutter application that demonstrates how to access the device's GPS location, print the coordinates, and display the location on a map using OpenStreetMap.

## Features

- **Get Current Location**: Accesses the device's GPS to retrieve latitude and longitude.
- **Map Integration**: Displays an interactive map using `flutter_map`.
- **Live Updates**: Moves the map center to the user's current location and places a marker.
- **Permission Handling**: Gracefully handles location permission requests for Android and iOS.

## Prerequisites

- Flutter SDK installed (v3.10.1 or higher recommended)
- Android Studio / Xcode for platform-specific configuration
- An Android Emulator or iOS Simulator (or physical device)

## Installation

1. **Clone or Open the Project**
   Navigate to the project directory:
   ```bash
   cd pf_36_map_access
   ```

2. **Install Dependencies**
   Run the following command to fetch the required packages:
   ```bash
   flutter pub get
   ```

3. **Platform Configuration**
   This project is already configured, but here is what was set up for your reference:

   **Android** (`android/app/src/main/AndroidManifest.xml`):
   Added permissions for fine and coarse location:
   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   <uses-permission android:name="android.permission.INTERNET"/>
   ```

   **iOS** (`ios/Runner/Info.plist`):
   Added usage description key:
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>This app needs access to location when open to show your position on the map.</string>
   ```

## Running the App

Run the application on your connected device or emulator:

```bash
flutter run
```

**Note for Simulators:**
- **Android Emulator**: You may need to manually set the location in the emulator settings (Extended Controls > Location) for the GPS to return a valid position.
- **iOS Simulator**: Go to `Features` > `Location` and select a predefined location (e.g., "Apple").

## How GPS Access Works

This application uses the `geolocator` package to handle cross-platform location services.

1. **Check Service Status**: The app first checks if location services (GPS) are enabled on the device using `Geolocator.isLocationServiceEnabled()`.
2. **Request Permissions**: It checks if the app has permission to access location. If not, it requests permission using `Geolocator.requestPermission()`.
3. **Get Position**: Once permitted, `Geolocator.getCurrentPosition()` is called with high accuracy settings to retrieve the `Position` object containing latitude and longitude.
4. **Display**: The coordinates are displayed in a Text widget and used to update the `MapController` of the `flutter_map` widget to center the view on the user.

## Dependencies

- [flutter_map](https://pub.dev/packages/flutter_map): A versatile mapping package for Flutter.
- [geolocator](https://pub.dev/packages/geolocator): A specific plugin for generic location (GPS) functionality.
- [latlong2](https://pub.dev/packages/latlong2): A lightweight library for common latitude and longitude calculations.

## Troubleshooting

- **Permission Denied**: If you denied permission, you might need to go to the App Settings on your device and manually enable Location access.
- **Location Not Found**: Ensure your device has a clear view of the sky or that your emulator has a location set.
