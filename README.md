# Flutter - Instagram Clone

A completely Responsive Instagram App - Works on Android, iOS & Web!

## Features
- Responsive Instagram UI
- Email & Password Authentication
- Share Posts with Caption
- Display Posts with Caption
- Like & Comment on Posts
- Search Users
- Follow Users
- Display User Posts, Followers & Following
- EVERYTHING REAL TIME
- Sign Out

## Installation
After cloning this repository, navigate to the `instagram-flutter-clone` folder. Then, follow the steps below:

### Firebase Setup
1. Create a Firebase Project
2. Enable Authentication
3. Configure Firestore Rules
4. Create Android, iOS & Web Apps in Firebase
5. Take the Web FirebaseOptions and replace my keys in the `main` function of `main.dart` file (My keys won't work as I deleted my project)

### Running the App
Run the following commands to start your app:
```bash
flutter pub get
open -a simulator  # to open iOS Simulator
flutter run
flutter run -d chrome --web-renderer html  # to view the best web output
```

## Tech Used
### Server
- Firebase Auth
- Firebase Storage
- Firebase Firestore

### Client
- Flutter
- Provider

