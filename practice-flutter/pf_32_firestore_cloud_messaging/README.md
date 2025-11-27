# Flutter Firebase Cloud Messaging (FCM) Demo

This project is a sample Flutter application demonstrating how to receive push notifications using Firebase Cloud Messaging. It handles:
- Background notifications
- Foreground notifications (with heads-up display and sound)
- Notification taps (opening the app from a notification)

## Prerequisites

1.  **Google Account**: You need a Google account to access the [Firebase Console](https://console.firebase.google.com/).
2.  **Flutter SDK**: Installed and configured.
3.  **Node.js**: Required if you plan to use the FlutterFire CLI (Method 1).

---

## Step 1: Create a Firebase Project

1.  Go to the [Firebase Console](https://console.firebase.google.com/).
2.  Click **Add project**.
3.  Enter a project name (e.g., `fcm-demo`) and continue.
4.  Disable Google Analytics for this simple demo (optional) and click **Create project**.
5.  Wait for the project to be ready and click **Continue**.

---

## Step 2: Configure Firebase with Flutter

You can configure Firebase in your Flutter app in two ways:
1.  **FlutterFire CLI (Recommended & Easiest)**
2.  **Manual Configuration**

### Method 1: FlutterFire CLI (Recommended)

This method automatically generates the `firebase_options.dart` file and registers your Android/iOS apps in the Firebase console.

1.  **Install Firebase Tools (if not already installed):**
    ```bash
    npm install -g firebase-tools
    ```

2.  **Login to Firebase:**
    ```bash
    firebase login
    ```

3.  **Install FlutterFire CLI:**
    ```bash
    dart pub global activate flutterfire_cli
    ```

4.  **Configure the App:**
    Run the following command in your project root directory:
    ```bash
    flutterfire configure
    ```
    - Select your Firebase project (created in Step 1).
    - Select the platforms you want to support (Android, iOS, MacOS, Web).
    - The CLI will register the apps and create `lib/firebase_options.dart`.

5.  **Done!** Your app is now connected.

### Method 2: Manual Configuration

If you prefer to set up everything manually, follow these steps.

#### Android Setup

1.  In the Firebase Console, go to **Project Overview** -> **Project settings**.
2.  Click the **Android** icon to add an Android app.
3.  **Register App:**
    - **Android package name**: Open `android/app/build.gradle` and find `applicationId`. It usually looks like `com.example.pf_32_firestore_cloud_messaging`.
    - Click **Register app**.
4.  **Download Config File:**
    - Download `google-services.json`.
    - Place this file inside your Flutter project at `android/app/google-services.json`.
5.  **Add SDKs:**
    - **Project-level `build.gradle`** (`android/build.gradle`):
      Add the Google services classpath inside `dependencies`:
      ```gradle
      classpath 'com.google.gms:google-services:4.3.15' // Check for latest version
      ```
    - **App-level `build.gradle`** (`android/app/build.gradle`):
      Add the plugin at the bottom of the file:
      ```gradle
      apply plugin: 'com.google.gms.google-services'
      ```
      Also ensure `minSdkVersion` is at least 19 (Flutter default is usually compatible, but FCM recommends 21+).

#### iOS Setup (Mac Only)

1.  In the Firebase Console, add an **iOS** app.
2.  **Register App:**
    - **iOS bundle ID**: Open `ios/Runner.xcodeproj` in Xcode or check `ios/Runner/Info.plist`. It usually looks like `com.example.pf32FirestoreCloudMessaging`.
    - Click **Register app**.
3.  **Download Config File:**
    - Download `GoogleService-Info.plist`.
    - Open `ios/Runner.xcworkspace` in Xcode.
    - Drag and drop `GoogleService-Info.plist` into the `Runner` folder inside Xcode. Ensure "Copy items if needed" is checked.

---

## Step 3: Platform Specific Configuration (Important)

Even after linking Firebase, you need some additional setup for notifications to work properly.

### Android

1.  **Permissions**:
    Open `android/app/src/main/AndroidManifest.xml` and add these permissions before the `<application>` tag:
    ```xml
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.VIBRATE"/>
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    ```

2.  **Notification Channel (Optional but recommended)**:
    The code in `notification_service.dart` sets up a default notification channel for foreground notifications.

### iOS

1.  **Capabilities**:
    - Open your project in Xcode (`ios/Runner.xcworkspace`).
    - Select the **Runner** target.
    - Go to **Signing & Capabilities**.
    - Click **+ Capability** and add **Push Notifications**.
    - Click **+ Capability** and add **Background Modes**. Check **Remote notifications**.

2.  **AppDelegate**:
    In `ios/Runner/AppDelegate.swift`, ensure you import Firebase and register for notifications (FlutterFire usually handles this, but good to know).

---

## Step 4: Run the Application

1.  Run the app on a physical device (Simulators often do not support receiving push notifications properly).
    ```bash
    flutter run
    ```
2.  When the app opens, it will ask for permission (on iOS/Android 13+). **Allow it**.
3.  The app handles the FCM Token. Copy it from the screen or the debug console.

---

## Step 5: Send a Test Notification

1.  Go to the **Firebase Console** -> **Messaging** (under Engage).
2.  Click **Create your first campaign** -> **Firebase Notification messages**.
3.  **Enter Notification Details**:
    - **Notification title**: "Hello Flutter"
    - **Notification text**: "This is a test message."
4.  **Target**:
    - Select **Single Device**.
    - Paste the **FCM Token** you copied from the app.
    - Click **Test**.
5.  **Result**:
    - **Foreground**: You should see a heads-up notification (banner) and hear a sound.
    - **Background/Terminated**: You should see a system notification tray item. Tapping it opens the app and updates the UI.

## Troubleshooting

- **No Sound?** Ensure your device is not in Silent mode. The code uses the default notification sound.
- **Build Errors?** If you get CocoaPods errors on iOS, try:
    ```bash
    cd ios
    rm -rf Pods
    pod install
    cd ..
    ```
- **Android Compilation Error?** Check if your `minSdkVersion` in `android/app/build.gradle` is at least 21.

## Code Overview

- **`lib/main.dart`**: Entry point. Initializes Firebase and listens for interaction events.
- **`lib/notification_service.dart`**: Handles all notification logic.
    - `initialize()`: Requests permissions and sets up listeners.
    - `_firebaseMessagingBackgroundHandler`: Top-level function for background handling.
    - `_showForegroundNotification`: Uses `flutter_local_notifications` to show a banner when the app is open.
