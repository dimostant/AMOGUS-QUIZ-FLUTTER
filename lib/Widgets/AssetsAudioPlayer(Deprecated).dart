import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../GlobalData.dart';

class assetsAudioPlayer extends StatefulWidget {
  const assetsAudioPlayer({Key? key}) : super(key: key);

  @override
  State<assetsAudioPlayer> createState() => _assetsAudioPlayerState();
}

class _assetsAudioPlayerState extends State<assetsAudioPlayer> {
  String audioasset = "sound/AMOGUS.mp3";
  bool isPlaying = false;

  final cache = AudioCache(fixedPlayer: AudioPlayer());

  @override
  void initState() {
    super.initState();
    start();
  }

  void start() async {
    await cache.fixedPlayer?.seek(position);
    await cache.loop(audioasset);
    isPlaying = true;
  }

  void getDuration() async {
    await cache.fixedPlayer?.getCurrentPosition();
  }

  void changePlayerStatus() async {
    if (isPlaying == true) {
      await cache.fixedPlayer?.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await cache.fixedPlayer?.resume();
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        if (isPlaying == true)
          IconButton(
            icon: const Icon(IconData(0xf0297, fontFamily: 'MaterialIcons')),
            onPressed: () {
              changePlayerStatus();
            },
          )
        else
          IconButton(
            icon: const Icon(IconData(0xf0299, fontFamily: 'MaterialIcons')),
            onPressed: () {
              changePlayerStatus();
            },
          ),
      ],
    ));
  }
}
