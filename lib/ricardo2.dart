import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class RicardoSecond extends StatefulWidget {
  @override
  _RicardoSecondState createState() => _RicardoSecondState();
}

class _RicardoSecondState extends State<RicardoSecond> {

  AudioCache cache = AudioCache(); // you have this
  AudioPlayer player = AudioPlayer(); // create this

void _playFile() async{
  player = await cache.play('ric_mus2.mp3'); // assign player here
}

void _stopFile() {
  player?.stop(); // stop the file like this
}


  @override
  void initState() {
    super.initState();
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
          "images/orig4.gif",
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
