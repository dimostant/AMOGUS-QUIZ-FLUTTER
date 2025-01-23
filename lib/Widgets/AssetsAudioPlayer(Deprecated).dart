import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AssetsAudioPlayer extends StatefulWidget {
  const AssetsAudioPlayer({Key? key}) : super(key: key);

  @override
  State<AssetsAudioPlayer> createState() => _AssetsAudioPlayerState();
}

class _AssetsAudioPlayerState extends State<AssetsAudioPlayer> {
  final String audioasset = "sound/AMOGUS.mp3";
  bool isPlaying = false;

  final AudioPlayer _player = AudioPlayer(); // Directly using AudioPlayer
  final AudioCache _cache = AudioCache();    // Separate cache for loading assets
  Duration _position = Duration.zero;        // Default position at start

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _player.dispose(); // Dispose of the player when the widget is removed
    super.dispose();
  }

  Future<void> _start() async {
    // Load the audio file and play it
    final url = await _cache.load(audioasset);
    await _player.setUrl(url.path, isLocal: true);
    await _player.seek(_position); // Use seek instead of setPosition
    await _player.setReleaseMode(ReleaseMode.LOOP);
    await _player.resume();

    setState(() {
      isPlaying = true;
    });
  }

  Future<void> _changePlayerStatus() async {
    if (isPlaying) {
      await _player.pause();
    } else {
      await _player.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
          ),
          onPressed: _changePlayerStatus,
        ),
      ],
    );
  }
}
