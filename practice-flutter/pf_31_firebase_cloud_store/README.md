# Simple Firebase Cloud Firestore Example

This is a beginner-friendly Flutter application demonstrating how to use **Google Firebase Cloud Firestore** to create a simple "Notes" app. It supports **CRUD** operations: **C**reate, **R**ead, **U**pdate, and **D**elete.

## Features

*   **Add Note**: Create a new note with a title and content.
*   **View Notes**: Real-time list of notes streamed directly from Firestore.
*   **Edit Note**: Update existing notes.
*   **Delete Note**: Remove notes from the database.
*   **Beautiful UI**: Clean and modern Material 3 design.

---

## 🚀 Step-by-Step Setup Guide

You have **two options** to set up Firebase for this project. 
1.  **Option A (Manual)**: Good for understanding exactly what files are needed.
2.  **Option B (Automated - Recommended)**: Uses `flutterfire` CLI to configure everything automatically.

---

### Option A: Manual Setup (Download Config Files)

Follow these steps if you prefer to manually place the configuration files.

#### Step 1: Create a Firebase Project
1.  Go to the [Firebase Console](https://console.firebase.google.com/).
2.  Click on **"Add project"**.
3.  Enter a project name (e.g., `Flutter Firestore Demo`) and click **Continue**.
4.  (Optional) Disable Google Analytics for this simple demo, then click **Create project**.
5.  Wait for creation and click **Continue**.

#### Step 2: Android Setup
1.  Click the **Android icon** (green robot) on the Project Overview page.
2.  **Android package name**: Open `android/app/build.gradle.kts` (or `build.gradle`) in your project. Look for `applicationId`. It is likely `com.example.pf_31_firebase_cloud_store`. Copy and paste it.
3.  Click **Register app**.
4.  **Download config file**:
    *   Click the big blue button **Download google-services.json**.
    *   Locate the file in your Downloads folder.
5.  **Move file**: 
    *   Drag and drop the `google-services.json` file into your project's `android/app/` directory.
    *   **Important**: The file name must be exactly `google-services.json`. If you downloaded it multiple times (e.g., `google-services(1).json`), rename it.
6.  Click **Next** through the remaining SDK instruction steps (the project is already pre-configured with necessary Gradle plugins).

#### Step 3: iOS Setup (Mac Only)
1.  Click **Add app** -> **iOS icon** on the Project Overview page.
2.  **Apple bundle ID**: Open `ios/Runner.xcodeproj` using Xcode or check `ios/Runner/Info.plist`. It is likely `com.example.pf31FirebaseCloudStore`.
3.  Click **Register app**.
4.  **Download config file**:
    *   Click **Download GoogleService-Info.plist**.
5.  **Move file**:
    *   Open the `ios/Runner` folder in **Xcode** (right-click `ios/` folder -> Open in Xcode).
    *   Drag the file into the Runner folder in the Xcode file explorer.
    *   **Ensure "Copy items if needed" is checked** when prompted.
6.  Click **Next** through the remaining steps.

---

### Option B: Automated Setup (FlutterFire CLI)

This is the modern, recommended way to configure Firebase apps.

#### Prerequisites
1.  Install [Firebase CLI](https://firebase.google.com/docs/cli#install_the_firebase_cli) if you haven't (via `npm install -g firebase-tools` or the auto-install script).
2.  Log in to Firebase:
    ```bash
    firebase login
    ```
3.  Install the FlutterFire CLI:
    ```bash
    dart pub global activate flutterfire_cli
    ```

#### Configuration
1.  Run the configure command in your project terminal:
    ```bash
    flutterfire configure
    ```
2.  **Select Project**: Use arrow keys to select the Firebase project you created in Step 1 (or create a new one right there).
3.  **Select Platforms**: Select `android` and `ios` (use Space to select/deselect, Enter to confirm).
4.  **Override Files**: If asked to override existing files (like `google-services.json`), type `y`.
5.  **Done!** The CLI generates a `lib/firebase_options.dart` file and automatically places the JSON/Plist files for you.

*Note: If you use this method, modify `lib/main.dart` to use the generated options:*
```dart
// In lib/main.dart
import 'firebase_options.dart'; // Add this import

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform, // Add this argument
);
```

---

### Step 4: Enable Cloud Firestore (Required for both options)

1.  In the Firebase Console sidebar, go to **Build** -> **Firestore Database**.
2.  Click **Create database**.
3.  **Location**: Choose a location near you (e.g., `nam5 (us-central)`). Click **Next**.
4.  **Security Rules**: Select **Start in test mode**.
    *   *Warning*: Test mode allows anyone to read/write for 30 days. Perfect for learning, but secure it before publishing.
5.  Click **Enable**.

---

### Step 5: Run the Application

1.  Open your terminal in the project folder.
2.  Run the app:
    ```bash
    flutter run
    ```

---

## 📝 Understanding the Code

The main logic is inside `lib/main.dart`. Here is a quick breakdown:

*   **`main()`**: Initializes Firebase (`Firebase.initializeApp()`) before running the app.
*   **`StreamBuilder`**: This is the magic widget. It listens to the Firestore collection stream. Whenever data changes on the server, this widget automatically rebuilds with the new data!
*   **`CollectionReference`**: Represents the 'notes' collection in your database.

### Key Functions Used:
*   `.add({...})`: Adds a new document to the collection.
*   `.snapshots()`: Returns a stream of data for real-time updates.
*   `.doc(id).update({...})`: Updates a specific document.
*   `.doc(id).delete()`: Deletes a specific document.
