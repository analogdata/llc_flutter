# Image Detection App

A simple Flutter application that uses Google ML Kit to detect objects using the device's camera in real-time.

## Features

- Real-time object detection from camera stream.
- Displays detected labels with confidence scores.
- Works on Android and iOS.

## Prerequisites

- Flutter SDK (Latest version recommended)
- Android Studio / Xcode
- Physical device (Camera features may not work on all simulators)

## Setup

1. **Clone the repository** (if applicable) or navigate to the project directory.

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

## Platform Specific Configuration

### Android

The `minSdkVersion` is set to 21 in `android/app/build.gradle.kts` as required by Google ML Kit.

### iOS

The `Info.plist` has been updated with the following keys:
- `NSCameraUsageDescription`: Required for camera access.
- `NSMicrophoneUsageDescription`: Required by the camera plugin.

## Running the App

Connect your device and run:

```bash
flutter run
```

## How it Works

1. The app initializes the camera and the Google ML Kit Image Labeler.
2. It starts a stream of images from the camera.
3. Each image frame is converted to an `InputImage` format compatible with ML Kit.
4. The `ImageLabeler` processes the image and returns a list of labels (detected objects).
5. The UI updates to show the labels and their confidence percentages.
