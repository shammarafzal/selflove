import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:flutter/foundation.dart';
import '../../AudioPlayer/audio_player.dart';

class MeditationDetails extends StatefulWidget {
  const MeditationDetails({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.desc,
    required this.long_desc,
    required this.media,
  }) : super(key: key);
  final imagePath;
  final title;
  final desc;
  final long_desc;
  final media;
  @override
  _MeditationDetailsState createState() => _MeditationDetailsState();
}

class _MeditationDetailsState extends State<MeditationDetails> {
  late AudioPlayer advancePlayer;
  @override
  void initState(){
    super.initState();
    advancePlayer = AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {
            advancePlayer.dispose(),
            Navigator.of(context).pop()},
        ),
        title: Text('${widget.title}'),
        backgroundColor: Color.fromRGBO(254, 176, 149, 1),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.imagePath), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.title}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Container(
              height: 200,
              child:
              AudioFile(
                advancePlayer: advancePlayer,
                audioPath: widget.media,
              ),
              // MusicPlayer(
              //   media: widget.media,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.desc}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.long_desc}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
