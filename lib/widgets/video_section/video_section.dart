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
  bool _isVideoInitialized = false;
  bool _isThumbnailVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      videoHome,
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    )..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _isThumbnailVisible = false; // Hide the thumbnail when video starts
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
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
                    PlatformView.web => 4 / 2,
                  },
                  child: _isThumbnailVisible
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Image.asset(
                            thumbnail,
                            fit: BoxFit.contain,
                          ),
                        )
                      : VideoPlayer(_controller),
                ),
              ),
            ),
            // Play button overlay
            Positioned.fill(
              child: Container(
                padding: ScreenConfig.getHorizontalPadding(context, 25),
                color: Colors.transparent,
                child: _controller.value.isPlaying
                    ? SizedBox.shrink()
                    : Center(
                        child: Icon(
                          Icons.play_circle_outline,
                          size: ScreenConfig.getHeightPercentage(context, 5),
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
