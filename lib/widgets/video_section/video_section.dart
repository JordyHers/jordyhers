import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  final PlatformView platformView;

  VideoSection(
    this.platformView, {
    Key? key,
  }) : super(key: key);

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late VideoPlayerController _controller;

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
  void dispose() {
    super.dispose();
    _controller.dispose();
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
          width: ScreenConfig.getWidthPercentage(context, 66.7),
          child: Stack(
            children: [
              Padding(
                padding: ScreenConfig.getPadding(context, 2, 2),
                child: Center(
                    child: AspectRatio(
                  aspectRatio: switch (widget.platformView) {
                    PlatformView.mobile => _controller.value.aspectRatio,
                    PlatformView.web => 3 / 2,
                  },
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
                  padding: ScreenConfig.getHorizontalPadding(context, 25),
                  color: _controller.value.isPlaying
                      ? Colors.transparent
                      : Colors.indigoAccent.withOpacity(0.3),
                  child: _controller.value.isPlaying
                      ? SizedBox.shrink()
                      : Center(
                          child: Icon(
                            Icons.play_circle_outline,
                            size: ScreenConfig.getHeightPercentage(context, 5),
                          ),
                        ),
                ),
              )),
            ],
          )),
    );
  }
}
