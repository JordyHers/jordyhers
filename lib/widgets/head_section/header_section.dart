import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:jordyhers/utils/enums.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatefulWidget {
  final PlatformView platformView;

  HeaderSection(this.platformView, {Key? key}) : super(key: key);

  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final String image = "assets/images/jordy_about.jpg";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context, listen: false);
    return Container(
      height: ScreenConfig.getHeightPercentage(context, 85),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -250 * (0.8 - _fadeAnimation.value)),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.platformView == PlatformView.web) ...[
                    Padding(
                      padding: ScreenConfig.getHorizontalPadding(context, 10),
                      child: Text(
                        "Hello, I'm ",
                        style: GoogleFonts.lora(
                          fontSize:
                              ScreenConfig.getHeightPercentage(context, 8),
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodySmall!
                              .color,
                        ),
                      ),
                    ),
                    Padding(
                      padding: ScreenConfig.getHorizontalPadding(context, 10),
                      child: Text(
                        "Jordy Hershel. 🚀 ",
                        style: GoogleFonts.lora(
                          fontSize:
                              ScreenConfig.getHeightPercentage(context, 8),
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: ScreenConfig.getHeightPercentage(context, 5)),
                    Padding(
                      padding: ScreenConfig.getPadding(context, 10, 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width:
                                ScreenConfig.getWidthPercentage(context, 33.3),
                            child: SelectableText(
                              'Find your developer expert for all your projects and design for both back-end and front-end. Handle simple and complex projects using the latest tools and '
                              'the fastest growing platforms such as React Native and Flutter. '
                              'Your expert can also provide counseling to your dev teams. You can find me on Upwork for Freelance projects.',
                              style: GoogleFonts.lora(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  ScreenConfig.getHeightPercentage(context, 5)),
                          ElevatedButton(
                            onPressed: () {
                              repository.downloadFile(st.cvPath);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 8.0),
                                Text(
                                  'Download CV',
                                  style: GoogleFonts.inter(color: Colors.white),
                                ),
                                const SizedBox(width: 12.0),
                                Icon(Icons.download),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side: BorderSide(
                                width: 2.0,
                                color: Colors.white,
                              ),
                              padding: ScreenConfig.getPadding(context, 2, 2),
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (widget.platformView == PlatformView.mobile) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Hello, I'm ",
                        textScaler: TextScaler.linear(0.8),
                        style: GoogleFonts.lora(
                          fontSize:
                              ScreenConfig.getHeightPercentage(context, 6),
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context)
                              .primaryTextTheme
                              .bodySmall!
                              .color,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Jordy Hershel. 🚀 ",
                        textScaler: TextScaler.linear(0.8),
                        style: GoogleFonts.lora(
                          fontSize:
                              ScreenConfig.getHeightPercentage(context, 6),
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (widget.platformView == PlatformView.web) ...[
            Align(
              alignment: Alignment.topRight,
              child: Transform.scale(
                scale: ScreenConfig.getWidthPercentage(context, 7) / 100,
                child: Padding(
                  padding: ScreenConfig.getPadding(context, 5, 10),
                  child: ClipOval(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 150 * (1 - _fadeAnimation.value)),
                          child: child,
                        );
                      },
                      child: Image.asset(
                        image,
                        height: ScreenConfig.getHeightPercentage(context, 60),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (widget.platformView == PlatformView.mobile) ...[
            Align(
              alignment: Alignment.center,
              child: Transform.scale(
                scale: ScreenConfig.getWidthPercentage(context, 20) / 100,
                child: Padding(
                  padding: ScreenConfig.getHorizontalPadding(context, 5),
                  child: ClipOval(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 130 * (1 - _fadeAnimation.value)),
                          child: child,
                        );
                      },
                      child: Image.asset(
                        image,
                        height: ScreenConfig.getHeightPercentage(context, 40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
