import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoSection extends StatefulWidget {
  bool isMobile;
  VideoSection({Key? key, required this.isMobile}) : super(key: key);

  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      videoProfile,
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Container(
          width: getWidth(context) / 1.5,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: AspectRatio(
                  aspectRatio:
                      widget.isMobile ? _controller.value.aspectRatio : 3 / 2,
                  child: VideoPlayer(_controller),
                )),
              ),
              Positioned.fill(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getWidth(context) * 0.25),
                  color: _controller.value.isPlaying
                      ? Colors.transparent
                      : Colors.indigoAccent.withOpacity(0.3),
                  child: _controller.value.isPlaying
                      ? SizedBox.shrink()
                      : Center(
                          child: Icon(
                            Icons.play_circle_outline,
                            size: getHeight(context) * 0.05,
                          ),
                        ),
                ),
              )),
            ],
          )),
    );
  }
}
