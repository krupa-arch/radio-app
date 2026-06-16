# Web Local Music Folder Access

## Overview
The web app now supports accessing local music folders using the **File System Access API**, allowing you to browse and play music from folders like `C:\Users\preet\Music\song's` directly in your browser.

## How It Works

### For Users
1. Navigate to the **Local Music** screen in the web app
2. Click **"Select Music Folder"**
3. A browser dialog will appear asking you to select a folder
4. Navigate to your music folder (e.g., `C:\Users\preet\Music\song's`)
5. Click **"Select Folder"** or **"Allow"**
6. The app will scan all audio files (MP3, WAV, FLAC, AAC, M4A, OGG) in that folder and subfolders
7. Your music will appear in the list and you can play it

### Browser Compatibility
The File System Access API is supported in:
- ✅ Chrome/Edge 86+
- ✅ Opera 72+
- ❌ Firefox (not yet supported)
- ❌ Safari (not yet supported)

For unsupported browsers, the app will fall back to the file picker (select individual files).

## Technical Implementation

### Files Modified/Created
1. **`web/file_system_api.js`** - JavaScript wrapper for File System Access API
2. **`lib/services/music_service_web.dart`** - Dart web implementation using dart:js_interop
3. **`lib/services/music_service_stub.dart`** - Stub for non-web platforms
4. **`lib/services/music_service.dart`** - Updated to use conditional imports
5. **`lib/providers/music_provider.dart`** - Updated to handle web differently
6. **`lib/screens/local_music_screen.dart`** - Updated UI for web
7. **`lib/models/song.dart`** - Removed webBytes field (using object URLs instead)
8. **`web/index.html`** - Added file_system_api.js script
9. **`pubspec.yaml`** - Added web package dependency

### Architecture
```
User clicks "Select Music Folder"
    ↓
MusicProvider.initAndLoad()
    ↓
MusicService.fetchLocalMusic()
    ↓
music_service_web.pickFolderAndScan()
    ↓
JavaScript: requestDirectoryAccess() → showDirectoryPicker()
    ↓
JavaScript: scanMusicFiles() → recursively scan directory
    ↓
Store File objects in _webFiles map
    ↓
Return List<Song> to Dart
    ↓
User clicks play
    ↓
MusicService.playSong()
    ↓
music_service_web.getObjectUrl() → URL.createObjectURL()
    ↓
just_audio plays from object URL
```

### Security & Privacy
- The app only requests **read** access to the selected folder
- No data is uploaded or sent anywhere
- File access is limited to the folder you explicitly select
- The browser may remember your permission for future visits (depending on browser settings)

## Troubleshooting

### "No audio files found"
- Make sure the folder contains audio files with supported extensions (.mp3, .wav, .flac, .aac, .m4a, .ogg)
- Check that files are in the selected folder or its subfolders

### Permission dialog doesn't appear
- Make sure you're using a supported browser (Chrome/Edge 86+)
- Check that the page is served over HTTPS or localhost
- Try refreshing the page

### "Allow Access" button not working
- Check browser console for errors (F12 → Console tab)
- Ensure file_system_api.js is loaded (check Network tab)
- Try a different browser

### Files won't play
- Check that the audio format is supported by your browser
- Verify the file isn't corrupted
- Check browser console for playback errors

## Future Enhancements
- Remember last selected folder (using IndexedDB)
- Support for drag-and-drop folder selection
- Metadata extraction (artist, album, duration) from audio files
- Playlist creation and management
- Album artwork display
