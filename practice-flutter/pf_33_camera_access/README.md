# Flutter Camera & Video Recording App

This project is a Flutter application that demonstrates how to access the device's camera to take pictures and record videos. It uses the `camera` and `video_player` packages to provide a complete media capture and playback experience.

## Features

*   **Camera Preview**: Displays a real-time feed from the device's camera.
*   **Photo Capture**: Allows users to take high-resolution photos.
*   **Video Recording**: Supports recording videos with audio.
*   **Media Preview**:
    *   Displays captured photos immediately after taking them.
    *   Plays back recorded videos with a loop function.
*   **Toggle Camera**: Supports switching between front and back cameras (if available/implemented in expansion).
*   **State Management**: Handles camera initialization, recording states, and resource disposal properly.

## Prerequisites & Setup

Before running the app, ensure you have configured the native platforms correctly.

### Dependencies

The following packages are used in `pubspec.yaml`:

*   `camera`: Provides tools to work with the cameras on the device.
*   `video_player`: Used to play back the recorded videos.
*   `path_provider`: Finds the correct paths to store images and videos.
*   `path`: Helper for manipulating file paths.

### Android Configuration

The `camera` plugin requires a minimum Android SDK version of 21.

1.  Open `android/app/build.gradle` (or `build.gradle.kts`).
2.  Locate the `defaultConfig` block.
3.  Update `minSdkVersion` to 21:

```gradle
defaultConfig {
    // ...
    minSdkVersion 21
    // ...
}
```

### iOS Configuration

You must add usage descriptions to `ios/Runner/Info.plist` to request permission from the user.

```xml
<key>NSCameraUsageDescription</key>
<string>We need access to the camera to take pictures and videos.</string>
<key>NSMicrophoneUsageDescription</key>
<string>We need access to the microphone to record audio for videos.</string>
```

## How It Works

### 1. Initialization (`main.dart`)

The entry point of the app initializes the Flutter bindings and the camera plugin *before* the app UI starts.

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Fetch the list of available cameras (front, back, etc.)
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}
```

### 2. Camera Controller (`_CameraScreenState`)

The core logic resides in `_CameraScreenState`. We use a `CameraController` to manage the connection to the camera device.

*   **`_initCamera()`**: Initializes the `CameraController` with a specific camera (e.g., the first one found) and a resolution preset. It returns a `Future` that we await in the UI (using `FutureBuilder`) to know when the camera is ready to show a preview.
*   **`CameraPreview` Widget**: A widget provided by the plugin that displays the live camera feed.

### 3. Taking Pictures

The `_takePicture()` method:
1.  Checks if the controller is initialized and not already capturing.
2.  Calls `controller.takePicture()`, which saves the image to a temporary file.
3.  Updates the state with the new `XFile` (`_capturedImage`), triggering a UI rebuild to show the image.

### 4. Recording Video

The `_toggleRecording()` method handles both starting and stopping video:
*   **Start**: Calls `controller.startVideoRecording()` and sets the `_isRecording` flag to true.
*   **Stop**: Calls `controller.stopVideoRecording()`, which returns the video file. It then initializes the video player to preview the result.

### 5. Video Playback

When a video is recorded, we initialize a `VideoPlayerController` with the file path.
*   **`_initVideoPlayer()`**: Prepares the video, sets it to loop, and starts playback.
*   **`VideoPlayer` Widget**: Renders the video content within an `AspectRatio` widget to ensure it isn't stretched.

### 6. Resource Disposal

To prevent memory leaks, it is crucial to dispose of controllers when the widget is removed from the tree.

```dart
@override
void dispose() {
  _controller?.dispose();       // Release camera resources
  _videoPlayerController?.dispose(); // Release video player resources
  super.dispose();
}
```

## Running the App

Connect a physical device (iOS or Android) and run:

```bash
flutter run
```

*Note: Simulators/Emulators may not support all camera features. Testing on a real device is recommended.*
