import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/enums.dart';

class MiddleSection extends StatelessWidget {
  final PlatformView platformView;
  const MiddleSection(
    this.platformView, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: switch (platformView) {
            PlatformView.mobile =>
              ScreenConfig.getHorizontalPadding(context, 15),
            PlatformView.web => ScreenConfig.getPadding(context, 10, 10),
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              switch (platformView) {
                PlatformView.mobile => SizedBox(height: 0),
                PlatformView.web => SizedBox(
                    height: ScreenConfig.getHeightPercentage(context, 10),
                  ),
              },
              SelectableText(
                'For all your mobile application projects.',
                style: GoogleFonts.inter(
                  fontSize: platformView == PlatformView.mobile ? 23 : 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.purpleAccent,
                ),
              ),
              SizedBox(
                height: platformView == PlatformView.mobile
                    ? ScreenConfig.getHeightPercentage(context, 2)
                    : ScreenConfig.getHeightPercentage(context, 5),
              ),
              switch (platformView) {
                PlatformView.mobile => SelectableText(
                    'Flutter | iOS ',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade700,
                    ),
                  ),
                PlatformView.web => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      SelectableText(
                        'Flutter',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                          width: ScreenConfig.getWidthPercentage(context, 5)),
                      FlutterLogo(size: 35),
                      SizedBox(
                          width: ScreenConfig.getWidthPercentage(context, 5)),
                      SizedBox(
                        width: ScreenConfig.getWidthPercentage(context, 5),
                      ),
                      Image.asset("assets/png/pngegg-13.png", height: 35),
                      SizedBox(
                          width: ScreenConfig.getWidthPercentage(context, 5)),
                      SelectableText(
                        'React Native',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        width: ScreenConfig.getWidthPercentage(context, 5),
                      ),
                      Image.asset("assets/png/pngegg-10.png", height: 35),
                      Spacer(),
                    ],
                  ),
              },
              Padding(
                padding: switch (platformView) {
                  PlatformView.mobile =>
                    ScreenConfig.getVerticalPadding(context, 2),
                  PlatformView.web => ScreenConfig.getPadding(context, 20, 5),
                },
                child: SelectableText(
                  "Flutter is amazing. But it can also be intimidating."
                  "With thousands of packages on pub.dev, over 400 widgets in the Flutter SDK, and over 40 state management solutions, where do you even start?\n\n"
                  "Would you like to get a curated list of resources, guiding you through the most important topics, and helping you choose the right tools and packages?"
                  " Would you like to become more productive and take your Flutter apps to the next level?"
                  " I know I would.",
                  style: GoogleFonts.inter(
                    fontSize: platformView == PlatformView.mobile ? 14 : 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500,
                    height: 1.8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: ScreenConfig.getVerticalPadding(context, 7),
          child: SizedBox.shrink(),
        ),
      ],
    );
  }
}
