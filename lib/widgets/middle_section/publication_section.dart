import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PublicationSection extends StatefulWidget {
  final PlatformView platformView;
  final ItemScrollController scrollController;

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
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
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
                          color: Colors.grey.shade700,
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
                            color: Colors.grey.shade700,
                            height: 1.8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      _buildPublicationLink(
                        context,
                        title: "ModePaz - Secure vault",
                        url:
                            'https://play.google.com/store/apps/details?id=com.jordyhers.modepaz_prod&hl=en',
                      ),
                      _buildPublicationLink(
                        context,
                        title: "Flutter - Any Logo",
                        url: 'https://pub.dev/packages/flutter_any_logo',
                      ),
                      _buildPublicationLink(
                        context,
                        title: "Flutter - Resume Template",
                        url: 'https://pub.dev/packages/flutter_resume_template',
                      ),
                      _buildPublicationLink(
                        context,
                        title: "Flutter - Floaty Widget",
                        url: 'https://pub.dev/packages/flutter_floaty',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPublicationLink(BuildContext context,
      {required String title, required String url}) {
    final repository = Provider.of<WebService>(context, listen: false);
    return Padding(
      padding: switch (widget.platformView) {
        PlatformView.mobile => ScreenConfig.getVerticalPadding(context, 2),
        PlatformView.web => ScreenConfig.getPadding(context, 20, 1),
      },
      child: GestureDetector(
        onTap: () => repository.launchURL(url),
        child: Text(
          title,
          style: GoogleFonts.lora(
            fontSize: switch (widget.platformView) {
              PlatformView.mobile => 14,
              PlatformView.web => 22,
            },
            fontWeight: FontWeight.w400,
            color: Colors.black,
            decoration: TextDecoration.underline,
            height: 1.8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
