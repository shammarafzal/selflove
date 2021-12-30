import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:flutter/foundation.dart';

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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
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
              child: MusicPlayer(
                media: widget.media,
              ),
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

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key? key, required this.media}) : super(key: key);
  final media;

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";
  IconData btnIcon = Icons.play_arrow;
  Duration duration = Duration();
  Duration position = Duration();

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }

  // Slider configuration

    // audioPlayer.onDurationChanged.listen((event) {
    //   if (mounted) {
    //     setState(() {
    //       duration = event;
    //     });
    //   }
    // });

    // audioPlayer.onAudioPositionChanged.listen((event) {
    //   if (mounted) {
    //     setState(() {
    //       position = event;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white70,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 300,
                  height: 100,
                  child: Slider(
                    value: 0,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    playMusic(widget.media);

                    if (isPlaying) {
                      audioPlayer.pause();
                      setState(() {
                        btnIcon = Icons.play_arrow;
                        isPlaying = false;
                      });
                    } else {
                      audioPlayer.resume();
                      setState(() {
                        btnIcon = Icons.pause;
                        isPlaying = true;
                      });
                    }
                  },
                  icon: Icon(
                    btnIcon,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
