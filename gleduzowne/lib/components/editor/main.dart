import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class VideoEditor extends StatefulWidget {
  const VideoEditor({super.key});

  @override
  _VideoEditorState createState() => _VideoEditorState();
}

class _VideoEditorState extends State<VideoEditor> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //     'https://www.example.com/video.mp4',
  //   )..initialize().then((_) {
  //     setState(() {});
  //   });
  // }


  Future<void> _initializeVideoPlayer() async {
    // Get the local file path (for example purposes, you can replace this with your actual file path)
    final directory = await getApplicationDocumentsDirectory();
    // final filePath = '${directory.path}/video.mp4';
    const filePath = '/Users/tony/Downloads/20240821_144450_1.mp4';


    _controller = VideoPlayerController.file(
      File(filePath),
    )..initialize().then((_) {
      setState(() {});
    });
  }



  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : const Center(child: CircularProgressIndicator()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _controller.seekTo(Duration.zero);
                    _controller.pause();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}