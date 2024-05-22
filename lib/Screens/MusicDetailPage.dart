import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:melody_project_mexique/Model/MusicDataResponse.dart';

class MusicDetailPage extends StatefulWidget {
  final List<MusicDataResponse> musicList;
  final int initialIndex;

  MusicDetailPage({Key? key, required this.musicList, required this.initialIndex}) : super(key: key);

  @override
  State<MusicDetailPage> createState() => _MusicDetailPageState();
}

class _MusicDetailPageState extends State<MusicDetailPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int currentIndex;

  _MusicDetailPageState() : currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    audioPlayer.onPlayerComplete.listen((_) {
      skipToNext();
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> setAudio() async {
    final currentMusic = widget.musicList[currentIndex];
    await audioPlayer.setSourceUrl(currentMusic.source.toString());
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    await audioPlayer.resume();
  }

  void skipToNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.musicList.length;
    });
    setAudio();
  }

  void skipToPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.musicList.length) % widget.musicList.length;
    });
    setAudio();
  }

  @override
  Widget build(BuildContext context) {
    final currentMusic = widget.musicList[currentIndex];
    final url = currentMusic.image.toString();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentMusic.title.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    currentMusic.artist.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Slider(
                    value: position.inSeconds.toDouble(),
                    min: 0,
                    activeColor: Colors.white,
                    max: duration.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final newPosition = Duration(seconds: value.toInt());
                      await audioPlayer.seek(newPosition);
                      await audioPlayer.resume();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTime(position),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          formatTime(duration - position),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.skip_previous, color: Color(0xFFFFD1DC)),
                        iconSize: 50,
                        onPressed: skipToPrevious,
                      ),
                      SizedBox(width: 20),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Color(0xFFFFD1DC),
                        child: IconButton(
                          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black),
                          iconSize: 50,
                          onPressed: () async {
                            if (isPlaying) {
                              await audioPlayer.pause();
                            } else {
                              await audioPlayer.resume();
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        icon: Icon(Icons.skip_next, color: Color(0xFFFFD1DC)),
                        iconSize: 50,
                        onPressed: skipToNext,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      twoDigitMinutes,
      twoDigitSeconds,
    ].join(':');
  }
}