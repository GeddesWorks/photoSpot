import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:js' as js;

class VideoScreen extends StatefulWidget {
  const VideoScreen({required this.url, super.key});

  static const routeName = '/video';

  final String url;

  @override
  State<StatefulWidget> createState() {
    return VideoState();
  }
}

class VideoState extends State<VideoScreen> {
  late VideoPlayerController vController;

  @override
  void initState() {
    super.initState();

    vController = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          vController.setVolume(0);
          vController.play();
          vController.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(),
      body: videoSection(context),
    );
  }

  Widget videoSection(BuildContext context) {
    return Center(
      child: vController.value.isPlaying
          ? VideoPlayer(vController)
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
    );
  }
}
