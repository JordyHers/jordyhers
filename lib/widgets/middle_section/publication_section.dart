import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:provider/provider.dart';

class PublicationSection extends StatefulWidget {
  final PlatformView platformView;
  final ScrollController scrollController;

  const PublicationSection(
    this.platformView, {
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  _PublicationSectionState createState() => _PublicationSectionState();
}

class _PublicationSectionState extends State<PublicationSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _animationTriggered = false;

  List<Color> colors = [
    Colors.grey.shade300,
    Colors.grey.shade300,
    Colors.grey.shade300,
    Colors.grey.shade300,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0), // Start from left
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!_animationTriggered &&
        widget.scrollController.offset >= kAppsAndPackagesOffset - 600) {
      _controller.forward();
      setState(() {
        _animationTriggered = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: switch (widget.platformView) {
        PlatformView.mobile => ScreenConfig.getVerticalPadding(context, 2),
        PlatformView.web => ScreenConfig.getVerticalPadding(context, 10),
      },
      child: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              width: switch (widget.platformView) {
                PlatformView.mobile =>
                  ScreenConfig.getWidthPercentage(context, 80),
                PlatformView.web =>
                  ScreenConfig.getWidthPercentage(context, 80),
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectableText(
                    'Our Apps and Publications',
                    style: GoogleFonts.lora(
                      fontSize: switch (widget.platformView) {
                        PlatformView.mobile => 23,
                        PlatformView.web => 35,
                      },
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  SizedBox(
                    height: switch (widget.platformView) {
                      PlatformView.mobile =>
                        ScreenConfig.getHeightPercentage(context, 2),
                      PlatformView.web =>
                        ScreenConfig.getHeightPercentage(context, 5),
                    },
                  ),
                  Padding(
                    padding: switch (widget.platformView) {
                      PlatformView.mobile =>
                        ScreenConfig.getVerticalPadding(context, 2),
                      PlatformView.web =>
                        ScreenConfig.getPadding(context, 20, 5),
                    },
                    child: SelectableText(
                      "We are thrilled to share with you our apps that are live. Feel free to "
                      "download them and give your feedback on how to improve them. We continuously strive to enhance user experience "
                      "and functionality based on your valuable input. Explore our creations, and be a part of our journey to create impactful digital solutions.",
                      style: GoogleFonts.lora(
                        fontSize: switch (widget.platformView) {
                          PlatformView.mobile => 14,
                          PlatformView.web => 17,
                        },
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade300,
                        height: 1.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _buildPublicationLink(
                    context,
                    title: "ModePaz - Secure vault",
                    url: kModePazUrl,
                    index: 0,
                  ),
                  _buildPublicationLink(
                    context,
                    title: "Flutter - Any Logo",
                    url: kFlutterAnyLogoUrl,
                    index: 1,
                  ),
                  _buildPublicationLink(
                    context,
                    title: "Flutter - Resume Template",
                    url: kFlutterResumeTemplateUrl,
                    index: 2,
                  ),
                  _buildPublicationLink(
                    context,
                    title: "Flutter - Floaty Widget",
                    url: kFlutterFloatyWidgetUrl,
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublicationLink(BuildContext context,
      {required String title, required String url, required int index}) {
    final repository = Provider.of<WebService>(context, listen: false);

    return Padding(
      padding: switch (widget.platformView) {
        PlatformView.mobile => ScreenConfig.getVerticalPadding(context, 2),
        PlatformView.web => ScreenConfig.getPadding(context, 20, 1),
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            colors[index] = Colors.blue;
          });
        },
        onExit: (_) {
          setState(() {
            colors[index] = Colors.white;
          });
        },
        child: GestureDetector(
          onTap: () => repository.launchURL(url),
          child: Text(
            title,
            style: GoogleFonts.lora(
              fontSize: switch (widget.platformView) {
                PlatformView.mobile => 14,
                PlatformView.web => 17,
              },
              fontWeight: FontWeight.w400,
              color: colors[index],
              decoration: TextDecoration.underline,
              decorationColor: colors[index],
              height: 1.8,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
