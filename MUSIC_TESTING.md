# Local Music Playback - Testing Instructions

## Implementation Complete ✅

The local music playback feature has been fully implemented with:
- Android 13+ support (READ_MEDIA_AUDIO permission)
- Android 10-12 support (READ_EXTERNAL_STORAGE permission)
- MediaStore API for querying music files
- MediaPlayer for playback
- Queue system for next/previous functionality

## Files Created/Modified:

### Flutter Files:
1. `lib/models/song.dart` - Song model
2. `lib/services/music_service.dart` - Native bridge service
3. `lib/providers/music_provider.dart` - State management
4. `lib/screens/local_music_screen.dart` - UI screen
5. `lib/main.dart` - Added MusicProvider
6. `lib/screens/dashboard_screen.dart` - Added Local tab

### Android Files:
1. `android/app/src/main/kotlin/com/example/radio_app/MainActivity.kt` - Native implementation
2. `android/app/src/main/AndroidManifest.xml` - Permissions added
3. `android/app/build.gradle` - minSdk=29, targetSdk=34

## Testing Steps:

### Step 1: Rebuild the App
```bash
cd "c:\radio app"
flutter clean
flutter pub get
flutter run
```

### Step 2: Navigate to Local Music
1. Open the app
2. Tap the **"Local"** tab (4th icon in bottom navigation - library_music icon)

### Step 3: Grant Permission
1. You should see "Music Permission Required" screen
2. Tap **"Grant Permission"** button
3. Android will show permission dialog
4. Tap **"Allow"** to grant READ_MEDIA_AUDIO permission

### Step 4: View Music List
- After granting permission, the app will automatically scan for music files
- You should see a list of all music files on your device
- Each song shows: Title, Artist, Duration

### Step 5: Play Music
1. Tap any song in the list
2. The song should start playing
3. The song will have a red border when playing
4. Mini player appears at the bottom

### Step 6: Control Playback
- **Pause**: Tap the pause button in mini player
- **Resume**: Tap the play button
- **Next**: Tap skip_next button
- **Previous**: Tap skip_previous button

## Troubleshooting:

### If No Songs Appear:
1. Make sure you have music files on your device
2. Music files should be in standard locations (Music folder, Downloads, etc.)
3. Tap the "Refresh" button in the empty state
4. Check logcat for errors: `adb logcat | findstr MainActivity`

### If Permission Dialog Doesn't Appear:
1. Go to Android Settings > Apps > Melora > Permissions
2. Manually grant "Music and audio" permission
3. Return to app and tap "Refresh"

### If Songs Don't Play:
1. Check logcat: `adb logcat | findstr "MainActivity\|MusicService"`
2. Ensure music files are valid audio files
3. Try a different song

## Expected Logs:

When working correctly, you should see these logs:
```
I/flutter: LocalMusicScreen: Checking permission...
I/flutter: MusicService: Checking permission...
D/MainActivity: hasPermission called, result: true
I/flutter: MusicService: Has permission: true
I/flutter: LocalMusicScreen: Has permission: true
I/flutter: LocalMusicScreen: Loading music...
I/flutter: MusicService: Calling getLocalMusic...
D/MainActivity: getLocalMusic called
D/MainActivity: Fetching local music...
D/MainActivity: Found X songs
I/flutter: MusicService: Received X songs from native
I/flutter: MusicProvider: Loaded X songs
I/flutter: LocalMusicScreen: Loaded X songs
```

When playing a song:
```
I/flutter: Song tapped: [Song Title]
I/flutter: Song URI: content://media/external/audio/media/[ID]
I/flutter: MusicService: Playing song with URI: content://...
D/MainActivity: playSong called with URI: content://...
D/MainActivity: Playing song: content://...
D/MainActivity: Preparing MediaPlayer...
D/MainActivity: Starting playback...
D/MainActivity: Playback started successfully
```

## Notes:

- The app uses MediaStore API (not direct file access) - compliant with Google Play policies
- Permissions are properly scoped for Android version
- Content URIs are used for playback (secure and recommended)
- Queue is automatically created when playing a song
- All songs in the list become part of the playback queue

## If Still Not Working:

1. Connect device via USB
2. Enable USB debugging
3. Run: `adb logcat -c` (clear logs)
4. Run: `adb logcat > logs.txt` (capture logs)
5. Open app, navigate to Local tab, grant permission, try to play a song
6. Stop logcat (Ctrl+C)
7. Check logs.txt for errors
