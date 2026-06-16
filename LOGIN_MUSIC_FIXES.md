# Login & Local Music Fixes

## Issues Fixed

### 1. Login Failing After Registration

**Problem:**
- User could register successfully but login would fail with "Invalid email or password"
- Email comparison was case-sensitive and didn't trim whitespace
- `dashboard_screen.dart` called `logout()` but `AuthService` only had `signOut()`

**Solution:**
- Normalized email comparison: trim + lowercase for both registration and login
- Added check for empty saved email (no account registered)
- Added `logout()` method as alias for `signOut()`

**Changes in `lib/services/auth_service.dart`:**
```dart
// Before
if (savedEmail == email && savedPass == password)

// After
final savedEmail = (prefs.getString(_userKey) ?? '').trim().toLowerCase();
final inputEmail = email.trim().toLowerCase();
if (savedEmail == inputEmail && savedPass == password)
```

### 2. Local Music Not Playing from Device

**Problem:**
- Device music path: `C:\Users\preet\Music\song's`
- Android `MainActivity.kt` only scans MediaStore (doesn't work on Windows emulator)
- Music files in custom folders weren't being detected

**Solution:**
- Updated `music_service.dart` to handle both Android and Windows/desktop
- **Android**: Uses MediaStore via MethodChannel (existing implementation)
- **Windows/Desktop**: Scans common music folders directly
  - `%USERPROFILE%\Music`
  - `%USERPROFILE%\Music\song's`
  - `%USERPROFILE%\Downloads`
  - `C:\Users\preet\Music`
  - `C:\Users\preet\Music\song's`

**Changes in `lib/services/music_service.dart`:**
- Added `_scanMusicFolder()` for desktop file scanning
- Added `_getMusicFolders()` to return platform-specific music paths
- Added `_isAudioFile()` to filter audio extensions (.mp3, .wav, .flac, .aac, .m4a, .ogg)
- Updated `playSong()` to handle both MediaStore URIs (`content://`) and file paths

## Testing

### Test Login Fix
1. Register with email: `Test@Example.com` and password: `test123`
2. Logout
3. Login with email: `test@example.com` (lowercase) and same password
4. Should login successfully ✅

### Test Local Music (Android)
```bash
flutter run -d android
```
1. Navigate to Local Music tab
2. Grant permission
3. Should see all music from MediaStore

### Test Local Music (Windows/Desktop)
```bash
flutter run -d windows
```
1. Place music files in `C:\Users\preet\Music\song's\`
2. Navigate to Local Music tab
3. Should see all .mp3, .wav, .flac files from the folder

## Supported Audio Formats
- MP3 (.mp3)
- WAV (.wav)
- FLAC (.flac)
- AAC (.aac)
- M4A (.m4a)
- OGG (.ogg)

## Platform-Specific Behavior

| Platform | Music Source | Permission Required |
|----------|--------------|---------------------|
| Android | MediaStore API | READ_MEDIA_AUDIO (Android 13+) or READ_EXTERNAL_STORAGE |
| Windows | File system scan | None |
| Linux | File system scan | None |
| macOS | File system scan | None |
| Web | Not supported | N/A |

## Notes

- Email is now stored in lowercase to prevent case-sensitivity issues
- Windows paths with special characters (like `song's`) are properly handled
- Desktop platforms don't require storage permissions
- MediaStore URIs (`content://`) and file paths are both supported for playback
