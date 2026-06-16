# Melora - AI-Powered Voice-Controlled Radio App

## Firebase Setup Instructions

### Step 1: Create Firebase Project
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" and name it "melora-app"
3. Enable Google Analytics (optional)
4. Click "Create project"

### Step 2: Enable Authentication
1. In Firebase Console, go to "Authentication"
2. Click "Get started"
3. Enable "Email/Password" sign-in method
4. Save

### Step 3: Add Android App
1. Click "Add app" → Android icon
2. Package name: `com.example.melora`
3. Download `google-services.json`
4. Place it in `android/app/` folder
5. Replace the existing placeholder file

### Step 4: Add iOS App (Optional)
1. Click "Add app" → iOS icon
2. Bundle ID: `com.example.melora`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` folder

### Step 5: Update Firebase Options
1. In Firebase Console, go to Project Settings
2. Copy your API keys for each platform
3. Update `lib/firebase_options.dart` with your actual keys:
   - `apiKey` for Android
   - `apiKey` for iOS
   - `apiKey` for Web

### Step 6: Run the App
```bash
flutter pub get
flutter run
```

## Features
- ✅ Email/Password Authentication
- ✅ Password Visibility Toggle
- ✅ Forgot Password
- ✅ Form Validation
- ✅ Error Messages
- ✅ Radio Streaming (Hindi, Tamil, Telugu, Malayalam, Kannada, English, News)
- ✅ Legal Music Playback
- ✅ Voice Commands
- ✅ Favorites
- ✅ AI Chatbot

## Troubleshooting

### "API key not valid" Error
- Make sure you've replaced the placeholder API keys in `lib/firebase_options.dart`
- Download the actual `google-services.json` from Firebase Console
- Ensure Firebase Authentication is enabled in Firebase Console

### Authentication Errors
- Check internet connection
- Verify email format is correct
- Password must be at least 6 characters
- Make sure Firebase project is properly configured
