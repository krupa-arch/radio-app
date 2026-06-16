# Melora - Voice-Controlled Radio App Setup Guide

## VOICE CONTROL SETUP

### 1. Grant Microphone Permission
- On first launch, the app will request microphone permission
- Go to Settings > Apps > Melora > Permissions > Microphone > Allow

### 2. Using Voice Commands

**HOW TO USE:**
1. Tap the microphone button (bottom-right corner)
2. Wait for "Listening" voice feedback
3. Speak your command clearly
4. The app will respond with voice feedback and execute the command

**SUPPORTED COMMANDS:**

**Play Radio:**
- "Play radio" - Plays first available station
- "Play Hindi" - Plays Hindi radio
- "Play Tamil" - Plays Tamil radio
- "Play Telugu" - Plays Telugu radio
- "Play Malayalam" - Plays Malayalam radio
- "Play Kannada" - Plays Kannada radio
- "Play Punjabi" - Plays Punjabi radio
- "Play Bengali" - Plays Bengali radio
- "Play Marathi" - Plays Marathi radio
- "Play Gujarati" - Plays Gujarati radio
- "Play Bollywood" - Plays Hindi/Bollywood radio
- "Play Kollywood" - Plays Tamil radio
- "Play Tollywood" - Plays Telugu radio

**Playback Control:**
- "Stop" - Stops playback
- "Pause" - Pauses current playback
- "Resume" / "Continue" / "Start" - Resumes playback
- "Next" - Plays next station
- "Previous" / "Back" - Plays previous station

**Other:**
- "Play music" - Plays music tracks
- "Play podcast" - Plays podcasts

## WORKING RADIO STATIONS

All stations use real streaming URLs:

### Hindi Stations (5 stations)
- Radio City 91.1 FM Hindi
- Red FM 93.5 Hindi
- Radio Mirchi 98.3 FM
- Bollywood Radio
- Hindi Hits Radio

### Tamil Stations (5 stations)
- Suryan FM 93.5
- Radio City Tamil
- Hello FM Tamil
- Tamil FM Radio
- Kollywood Hits

### Telugu, Malayalam, Kannada, Punjabi, Bengali, Marathi, Gujarati (5 each)
Total: 50+ working radio stations

## TROUBLESHOOTING

### Voice Commands Not Working
1. Check microphone permission in Settings
2. Ensure internet connection is active
3. Speak clearly after hearing "Listening"
4. Try again if command not recognized

### Radio Not Playing
1. Check internet connection
2. Try a different station
3. Some URLs may be temporarily unavailable
4. Check device volume

### App Crashes
1. Run: `flutter clean`
2. Run: `flutter pub get`
3. Rebuild the app

## TESTING VOICE CONTROL

1. Launch app
2. Tap microphone button
3. Say: "Play Hindi"
4. App should respond: "Playing Hindi radio"
5. Radio should start playing

## FEATURES

✅ Voice control with TTS feedback
✅ 50+ real radio stations (all Indian languages)
✅ Music playback
✅ Podcast playback
✅ Background audio
✅ Pause/Resume/Stop controls
✅ Next/Previous station
✅ Favorites
✅ Voice feedback for all actions
