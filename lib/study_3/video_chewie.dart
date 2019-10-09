import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(VideoApp());

final videoPlayerController = VideoPlayerController.network(
    'http://vd4.bdstatic.com/mda-jipxrs2qfcjwp34u/sc/mda-jipxrs2qfcjwp34u.mp4');

final chewieController = ChewieController(
  videoPlayerController: videoPlayerController,
  aspectRatio: 16 / 9,
  autoPlay: true,
  looping: true,
);

final playerWidget = Chewie(
  controller: chewieController,
);

class VideoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoAppState();
  }
}

class _VideoAppState extends State<VideoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: new Scaffold(body: playerWidget),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
