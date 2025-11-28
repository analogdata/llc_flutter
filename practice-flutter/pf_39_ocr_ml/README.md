# Simple OCR App

A simple Flutter application that demonstrates Optical Character Recognition (OCR) capabilities using the `google_mlkit_text_recognition` package. This app allows users to capture images using the camera or select them from the gallery and extract text from them.

## Features

- **Camera Integration**: Capture images directly within the app.
- **Gallery Integration**: Pick existing images from the device gallery.
- **OCR Processing**: Extract text from images using Google's ML Kit on-device text recognition.
- **Text Display**: View the extracted text in a selectable text area.

## Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed (version 3.0.0 or later recommended).
- **Android Studio / Xcode**: For building and deploying to Android/iOS devices.
- **Physical Device**: A physical Android or iOS device is recommended for testing camera functionality.

## Installation

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd pf_39_ocr_ml
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```

## Android Configuration

This project has been configured for Android with the following settings:

- **Min SDK Version**: 21 (Required by Google ML Kit).
- **Permissions**: The `image_picker` package handles basic camera and gallery intents. If you encounter permission issues on newer Android versions, ensure you have the necessary permissions in `AndroidManifest.xml`, although typically not required for basic intents.

## Dependencies

- [flutter](https://flutter.dev/): The UI toolkit.
- [image_picker](https://pub.dev/packages/image_picker): For capturing and picking images.
- [google_mlkit_text_recognition](https://pub.dev/packages/google_mlkit_text_recognition): For performing OCR on the selected images.

## Code Structure

- **`lib/main.dart`**: Contains the entire application logic, including the UI, image picking, and OCR processing.

## How it Works

1.  **Image Selection**: The user selects an image via the Camera or Gallery button.
2.  **Image Processing**: The selected image path is passed to the `TextRecognizer`.
3.  **Text Extraction**: The `processImage` method analyzes the image and returns a `RecognizedText` object.
4.  **Display**: The extracted text is displayed in the UI.

## Troubleshooting

- **"No Text Found"**: Ensure the image has clear, legible text and good lighting.
- **Build Errors**: If you encounter build errors related to `minSdkVersion`, ensure your `android/app/build.gradle.kts` has `minSdk` set to at least 21.

## License

This project is open source and available for educational purposes.
