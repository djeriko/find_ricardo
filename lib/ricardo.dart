import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Ricardo extends StatefulWidget {
  @override
  _RicardoState createState() => _RicardoState();
}

class _RicardoState extends State<Ricardo> {
  // final player = AudioCache();

  AudioCache cache = AudioCache(); // you have this
  AudioPlayer player = AudioPlayer(); // create this

void _playFile() async{
  player = await cache.play('ric_mus.mp3'); // assign player here
}

void _stopFile() {
  player?.stop(); // stop the file like this
}


  @override
  void initState() {
    super.initState();
    // player.play('ric_mus.mp3');
   _playFile();
  }

  @override
  void dispose() {
    super.dispose();
    _stopFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        child: Image.asset(
          "images/orig.gif",
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
