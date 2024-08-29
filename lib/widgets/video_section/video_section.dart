import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:video_player/video_player.dart';

class VideoSection extends StatefulWidget {
  final PlatformView platformView;
  final ScrollController scrollController;

  VideoSection(this.platformView, {Key? key, required this.scrollController})
      : super(key: key);

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _bounceAnimation;
  bool _isThumbnailVisible = true;
  bool _animationTriggered = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      videoHome,
      videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true),
    )..initialize().then((_) {
        setState(() {});
      });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(1, -3),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _bounceAnimation = Tween<double>(
      begin: 1.2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!_animationTriggered &&
        widget.scrollController.offset >= kVideoOffset - 2000) {
      _animationController.forward();
      _animationTriggered = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _isThumbnailVisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _bounceAnimation,
        child: GestureDetector(
          onTap: _togglePlayPause,
          child: Container(
            height: ScreenConfig.getHeightPercentage(context, 50),
            width: ScreenConfig.getWidthPercentage(context, 10),
            margin: switch (widget.platformView) {
              PlatformView.mobile => ScreenConfig.getPadding(context, 10, 10),
              PlatformView.web => ScreenConfig.getPadding(context, 30, 10),
            },
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: ScreenConfig.getPadding(context, 2, 2),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: _isThumbnailVisible
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                thumbnail,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: VideoPlayer(_controller),
                            ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    padding: ScreenConfig.getHorizontalPadding(context, 5),
                    color: Colors.transparent,
                    child: _controller.value.isPlaying
                        ? SizedBox.shrink()
                        : Center(
                            child: Icon(
                              Icons.play_circle_outline,
                              size: ScreenConfig.getHeightPercentage(
                                context,
                                5,
                              ),
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
