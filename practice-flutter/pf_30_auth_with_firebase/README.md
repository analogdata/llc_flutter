# Firebase Auth Flutter Demo

This project demonstrates a complete Authentication Flow using Firebase and Flutter. It includes Sign In, Sign Up, Forgot Password, Email Verification, Password Change, and a Dashboard with Profile management.

## 🚀 Prerequisites

Before you begin, ensure you have the following installed:
- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Node.js & npm** (required for Firebase CLI): [Install Node.js](https://nodejs.org/)

---

## 🛠️ Step 1: Create a Firebase Project

1.  Go to the [Firebase Console](https://console.firebase.google.com/).
2.  Click **"Add project"** (or "Create a project").
3.  Enter a project name (e.g., `auth-demo`) and click **Continue**.
4.  (Optional) Disable Google Analytics for this demo to keep it simple, then click **Create project**.
5.  Wait for the project to be created and click **Continue**.

---

## 🔐 Step 2: Enable Authentication

1.  In the Firebase Console, select your newly created project.
2.  In the left sidebar, click on **Build** -> **Authentication**.
3.  Click **"Get started"**.
4.  In the **Sign-in method** tab, select **Email/Password**.
5.  Toggle **Enable** switch to on.
6.  (Optional) Leave "Email link (passwordless sign-in)" disabled.
7.  Click **Save**.

---

## 💻 Step 3: Install Firebase CLI Tools

You need the Firebase CLI to connect your Flutter app to Firebase.

1.  Open your terminal (Command Prompt or Terminal).
2.  Install the Firebase tools globally:
    ```bash
    npm install -g firebase-tools
    ```
3.  Log in to Firebase:
    ```bash
    firebase login
    ```
    (This will open your browser. Log in with the same Google account you used for the Firebase Console).

4.  Install the FlutterFire CLI:
    ```bash
    dart pub global activate flutterfire_cli
    ```

---

## 🔗 Step 4: Configure the App

Now, link this Flutter code to your Firebase project.

### Option A: Automatic Configuration (Recommended)

1.  Open your terminal inside this project's root directory (where `pubspec.yaml` is).
2.  Run the configuration command:
    ```bash
    flutterfire configure
    ```
3.  **Select Project**: Use arrow keys to select the project you created in Step 1 and press Enter.
4.  **Select Platforms**: Use Spacebar to select/deselect platforms (Android, iOS, macOS, Web) you want to support. Press Enter to confirm.

    *The tool will automatically generate a `lib/firebase_options.dart` file with your specific API keys.*

### Option B: Manual Configuration (No CLI)

If you prefer not to use the CLI (or if it fails), follow these steps manually:

#### 🤖 Android Setup

1.  **Register App**:
    - Go to Project Overview in Firebase Console.
    - Click the **Android** icon.
    - Package name: `com.example.pf_30_auth_with_firebase` (found in `android/app/build.gradle.kts`).
    - Click **Register app**.
2.  **Download Config**:
    - Download `google-services.json`.
    - Move it into: `android/app/google-services.json`.
3.  **Update Gradle Files**:
    - **Settings** (`android/settings.gradle.kts`):
      Add the google services plugin to the `plugins` block:
      ```kotlin
      plugins {
          // ... existing plugins
          id("com.google.gms.google-services") version "4.4.2" apply false
      }
      ```
    - **App-level** (`android/app/build.gradle.kts`):
      Add the plugin at the top:
      ```kotlin
      plugins {
          id("com.android.application")
          id("com.google.gms.google-services") // Add this line
          // ...
      }
      ```

#### 🍎 iOS Setup

1.  **Register App**:
    - Go to Project Overview in Firebase Console.
    - Click the **iOS** icon.
    - Bundle ID: Open `ios/Runner.xcodeproj` in Xcode to find it (usually `com.example.pf30AuthWithFirebase` or similar).
    - Click **Register app**.
2.  **Download Config**:
    - Download `GoogleService-Info.plist`.
    - **Important**: Drag and drop this file into the `Runner` folder **inside Xcode**. Ensure "Copy items if needed" is checked.
    - File path should end up at: `ios/Runner/GoogleService-Info.plist`.

#### 📄 Update Dart Configuration
If you don't use `flutterfire configure`, you must update `lib/main.dart` to use the native configuration files instead of the generated Dart options.

1.  Open `lib/main.dart`.
2.  Replace the initialization code:
    ```dart
    // REPLACE THIS:
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // WITH THIS:
    await Firebase.initializeApp();
    ```


---

## 🏃‍♂️ Step 5: Run the App

1.  Get the dependencies:
    ```bash
    flutter pub get
    ```
2.  Run the application:
    ```bash
    flutter run
    ```

---

## 📱 App Features & How to Test

- **Sign Up**:
    - Click "Don't have an account? Sign Up" on the login screen.
    - Enter an email and password.
    - **Check your email inbox**: You should receive a verification link from Firebase.
- **Email Verification**:
    - After signing up, you are logged in.
    - If you haven't clicked the link in your email, the Home Dashboard will show a yellow warning banner.
    - Click the link in your email, then click the **Refresh** icon in the app banner to update your status.
- **Forgot Password**:
    - On the Login screen, click "Forgot Password?".
    - Enter your email to receive a reset link.
- **Profile & Logout**:
    - On the Home screen, click the user icon in the top right (AppBar).
    - You can see your email, **Change Password**, or **Logout**.

## ⚠️ Troubleshooting

- **"DefaultFirebaseOptions have not been configured"**: This means you skipped Step 4. You MUST run `flutterfire configure`.
- **Android Build Errors**: Ensure your `android/build.gradle` and `android/app/build.gradle` meet the minimum SDK requirements (usually minSdk 21 or higher for Firebase).
- **iOS Build Errors**: If running on iOS simulator, you might need to run `cd ios && pod install` (requires CocoaPods).

