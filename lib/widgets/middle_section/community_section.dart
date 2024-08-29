import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:provider/provider.dart';

class CommunitySection extends StatefulWidget {
  final PlatformView platformView;
  final ScrollController scrollController;

  CommunitySection(this.platformView,
      {Key? key, required this.scrollController})
      : super(key: key);

  @override
  _CommunitySectionState createState() => _CommunitySectionState();
}

class _CommunitySectionState extends State<CommunitySection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _animationTriggered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0), // Slide from left
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!_animationTriggered &&
        widget.scrollController.offset >= kCommunityOffset - 600) {
      _animationController.forward();
      setState(() {
        _animationTriggered = true;
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context);

    final EdgeInsets padding = switch (widget.platformView) {
      PlatformView.mobile => ScreenConfig.getPadding(context, 10, 10),
      PlatformView.web => ScreenConfig.getPadding(context, 10, 10),
    };

    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: padding,
        child: Container(
          height: ScreenConfig.getHeightPercentage(context, 40),
          width: ScreenConfig.getWidthPercentage(context, 80),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                'Join Our Community',
                style: GoogleFonts.lora(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: switch (widget.platformView) {
                      PlatformView.mobile => 20,
                      PlatformView.web => 35,
                    }),
              ),
              SizedBox(height: 20),
              SelectableText(
                'Discover our large community of developers on Discord. Join Hackathons,\n'
                'HacktoberFest under JordyHers. Develop Apps for both Android and iOS.',
                style: GoogleFonts.lora(
                  fontSize: switch (widget.platformView) {
                    PlatformView.mobile => 14,
                    PlatformView.web => 17,
                  },
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => repository.launchURL(discordLink),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  child: Text(
                    'Join Our Discord',
                    style: GoogleFonts.lora(
                      fontSize: ScreenConfig.getHeightPercentage(
                        context,
                        1.8,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
