import 'package:flutter/material.dart';
import 'package:self_love/Settings/SizeConfig.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rrx;
import 'package:audio_service/audio_service.dart';
import 'package:self_love/Views/CustomAudioPlayer/common.dart';
import '../main.dart';

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
              child: MainScreen(),
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

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Audio Service Demo'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show media item title
            StreamBuilder<MediaItem?>(
              stream: audioHandler.mediaItem,
              builder: (context, snapshot) {
                final mediaItem = snapshot.data;
                return Text(mediaItem?.title ?? '');
              },
            ),
            // Play/pause/stop buttons.
            StreamBuilder<bool>(
              stream: audioHandler.playbackState
                  .map((state) => state.playing)
                  .distinct(),
              builder: (context, snapshot) {
                final playing = snapshot.data ?? false;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(Icons.fast_rewind, audioHandler.rewind),
                    if (playing)
                      _button(Icons.pause, audioHandler.pause)
                    else
                      _button(Icons.play_arrow, audioHandler.play),
                    _button(Icons.stop, audioHandler.stop),
                    _button(Icons.fast_forward, audioHandler.fastForward),
                  ],
                );
              },
            ),
            // A seek bar.
            StreamBuilder<MediaState>(
              stream: _mediaStateStream,
              builder: (context, snapshot) {
                final mediaState = snapshot.data;
                return SeekBar(
                  duration: mediaState?.mediaItem?.duration ?? Duration.zero,
                  position: mediaState?.position ?? Duration.zero,
                  onChangeEnd: (newPosition) {
                    audioHandler.seek(newPosition);
                  },
                );
              },
            ),
            // Display the processing state.
            StreamBuilder<AudioProcessingState>(
              stream: audioHandler.playbackState
                  .map((state) => state.processingState)
                  .distinct(),
              builder: (context, snapshot) {
                final processingState =
                    snapshot.data ?? AudioProcessingState.idle;
                return Text(
                    "Processing state: ${describeEnum(processingState)}");
              },
            ),
          ],
        ),
      ),
    );
  }

  /// A stream reporting the combined state of the current media item and its
  /// current position.
  Stream<MediaState> get _mediaStateStream =>
      rrx.Rx.combineLatest2<MediaItem?, Duration, MediaState>(
          audioHandler.mediaItem,
          AudioService.position,
              (mediaItem, position) => MediaState(mediaItem, position));

  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
    icon: Icon(iconData),
    iconSize: 64.0,
    onPressed: onPressed,
  );
}

class MediaState {
  final MediaItem? mediaItem;
  final Duration position;

  MediaState(this.mediaItem, this.position);
}

/// An [AudioHandler] for playing a single item.
class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  static final _item = MediaItem(
    id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
    album: "Inner Power",
    title: "",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  final _player = AudioPlayer();

  /// Initialise our audio handler.
  AudioPlayerHandler() {
    // So that our clients (the Flutter UI and the system notification) know
    // what state to display, here we set up our audio handler to broadcast all
    // playback state changes as they happen via playbackState...
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);
    // ... and also the current media item via mediaItem.
    mediaItem.add(_item);

    // Load the player.
    _player.setAudioSource(AudioSource.uri(Uri.parse(_item.id)));
  }

  // In this simple example, we handle only 4 actions: play, pause, seek and
  // stop. Any button press from the Flutter UI, notification, lock screen or
  // headset will be routed through to these 4 methods so that you can handle
  // your audio playback logic in one place.

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() => _player.stop();

  /// Transform a just_audio event into an audio_service state.
  ///
  /// This method is used from the constructor. Every event received from the
  /// just_audio player will be transformed into an audio_service state so that
  /// it can be broadcast to audio_service clients.
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.rewind,
        if (_player.playing) MediaControl.pause else MediaControl.play,
        MediaControl.stop,
        MediaControl.fastForward,
      ],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      androidCompactActionIndices: const [0, 1, 3],
      processingState: const {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      playing: _player.playing,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }
}

