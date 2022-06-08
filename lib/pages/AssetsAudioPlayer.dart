import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class assetsAudioPlayer extends StatefulWidget {
  const assetsAudioPlayer({Key? key}) : super(key: key);

  @override
  State<assetsAudioPlayer> createState() => _assetsAudioPlayerState();
}

class _assetsAudioPlayerState extends State<assetsAudioPlayer> {

  String audioasset = "assets/sound/AMOGUS.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {

      ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        setState(() {
          //refresh the UI
        });

        start();

      super.initState();
   });
  }

  void start() async {
      if(!isplaying && !audioplayed){
        int result = await player.playBytes(audiobytes);
        if(result == 1){ //play success
          setState(() {
            isplaying = true;
            audioplayed = true;
          });
        }else{
          print("Error while playing audio.");
        }
      }else if(audioplayed && !isplaying){
        int result = await player.resume();
        if(result == 1){ //resume success
          setState(() {
            isplaying = true;
            audioplayed = true;
          });
        }else{
          print("Error on resume audio.");
        }
      }else{
        int result = await player.pause();
        if(result == 1){ //pause success
          setState(() {
            isplaying = false;
          });
        }else{
          print("Error on pause audio.");
        }
      }

  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
