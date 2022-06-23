import 'package:audioplayers/audioplayers.dart';

class Audio {
  String audioasset = "sound/AMOGUS.mp3";
  bool isPlaying = true;
  static AudioCache? _bgAudioCache = AudioCache(fixedPlayer: AudioPlayer());
  static AudioPlayer? _bgAudioPlayer;

  static AudioCache? getBGAudioCache() {
    if (_bgAudioCache == null)
      return _bgAudioCache = AudioCache(fixedPlayer: AudioPlayer());
    else
      return _bgAudioCache;
  }

  static void playBgMusic() async {
    if (_bgAudioPlayer == null) {
      _bgAudioPlayer =
          await getBGAudioCache()?.loop("sound/AMOGUS.mp3", volume: 0.1);
    } else
      _resumeBgMusic();
  }

  static void pauseBgMusic() async {
    await _bgAudioPlayer?.pause();
  }

  static void _resumeBgMusic() async {
    await _bgAudioPlayer?.resume();
  }

  static disposeBGMusic() {
    _bgAudioPlayer?.dispose();
  }

  static bool isBGMusicPlaying() {
    return _bgAudioPlayer?.state == PlayerState.PLAYING;
  }
}
