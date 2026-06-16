import 'package:just_audio/just_audio.dart';

void main() async {
  final player = AudioPlayer();
  
  // Test podcast URL
  final podcastUrl = 'https://hackerpublicradio.org/eps/hpr4400/hpr4400.mp3';
  print('Testing podcast URL: $podcastUrl');
  
  try {
    await player.setAudioSource(AudioSource.uri(Uri.parse(podcastUrl)));
    await player.play();
    print('SUCCESS: Podcast playing');
    await Future.delayed(Duration(seconds: 3));
    await player.stop();
  } catch (e) {
    print('ERROR: $e');
  }
  
  // Test music URL
  final musicUrl = 'https://streams.ilovemusic.de/iloveradio17.mp3';
  print('Testing music URL: $musicUrl');
  
  try {
    await player.setAudioSource(AudioSource.uri(Uri.parse(musicUrl)));
    await player.play();
    print('SUCCESS: Music playing');
    await Future.delayed(Duration(seconds: 3));
    await player.stop();
  } catch (e) {
    print('ERROR: $e');
  }
  
  player.dispose();
}
