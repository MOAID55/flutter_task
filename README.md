# flutter_task1

Flutter project.

## Getting Started

This project is a starting point for a Flutter application.




<img width="400" height="837" alt="Screenshot (45)" src="https://github.com/user-attachments/assets/139137b4-2250-443f-8fd5-1ff556cd3ba3" /> ![original design](https://github.com/user-attachments/assets/b6ed11fa-e0d2-4436-be48-6f9bc9b58c42)             









--- least two distinct occasions where you issue clear prompts to ProxyAI----

1- I gave a screenshot of the screen and wrote this prompt in the main file.
I want the same layout.


2- Organize my existing Flutter food menu app using MVVM architecture with Provider,
I want to structure my code using ul/, models/, datel, and viewmodel folders,
Show me what goes in each and how to refactor it.

---  how to run the app and populate its demo data.

Step 1: Download Flutter

1 - Go to flutter.dev and download the Flutter SDK for your OS.

2 - Move the ZIP File to C: Drive:

3 - Extract the downloaded file to a folder.

4 - Add flutter/bin to your system’s Path environment variable.

5 - Run flutter doctor in your terminal to check if everything is installed correctly.

Step 2: Install Android Studio

1 - Download and install Android Studio from developer.android.com/studio.

2 - Open Android Studio and install the Flutter and Dart plugins.

3 - Set up an Android device or emulator.

To Run App:

Open the project folder in terminal.

Run flutter run to launch the app.


How populate its demo data.

1 - Open Firebase Console

2 - Go to the Firebase Console.

3 - If you don't have an account, sign up
    for Firebase using your Google account. 
    If you're already signed in, just log in.

4 - Create a New Firebase Project

5 - In the Firebase Console, click Add Project and
    follow the prompts to create a new project.

6 - Enroll Your App in Firebase

7 - After your project is created, click on Add App and select Android.

8 - Register your app by providing the Android package name (find this in android/app/src/main/AndroidManifest.xml).

9 - Download the google-services.json file when prompted and place it in the android/app/ directory of your Flutter project.

Add Firebase SDK to Your Android App

In android/build.gradle, add the following classpath inside the dependencies block:
 --- classpath 'com.google.gms:google-services:4.3.15'  // Firebase plugin

In android/app/build.gradle, add the following line at the bottom of the file:
 --- apply plugin{ 'com.google.gms.google-services' }

Add Data to Firestore 

1- Create Firebase Firestore Databas 

2 - Create a Collection Named "product"

3 - Each document in the "product" collection will contain the following fields:
    id (type: string)
    imageUrl (type: string)
    name (type: string)
    price (type: double)

-------------------------------------------------------------------------End-----------





- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
