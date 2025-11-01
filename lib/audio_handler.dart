import 'package:just_audio/just_audio.dart';

class AudioHandler {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> setUrl(String url) async {
    try {
      await _audioPlayer.setUrl(url);
    } catch (e) {
      // handle error
    }
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void dispose() {
    _audioPlayer.dispose();
  }
}
