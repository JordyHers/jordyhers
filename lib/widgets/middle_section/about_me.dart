import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:jordyhers/utils/enums.dart';

class AboutMe extends StatelessWidget {
  final PlatformView platformView;

  const AboutMe(
    this.platformView, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ScreenConfig.getVerticalPadding(
          context, 5), // Equivalent to 30px vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: switch (platformView) {
              PlatformView.mobile => ScreenConfig.getPadding(context, 10, 2),
              PlatformView.web => ScreenConfig.getPadding(context, 20, 2),
            },
            child: SelectableText(
              'About Me',
              style: GoogleFonts.inter(
                  fontSize: platformView == PlatformView.mobile ? 22 : 40,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryTextTheme.bodySmall!.color),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getPadding(context, 10, 2),
                    PlatformView.web =>
                      ScreenConfig.getHorizontalPadding(context, 20),
                  },
                  child: FittedBox(
                    child: Container(
                      height: ScreenConfig.getHeightPercentage(
                          context, 17.5), // Equivalent to 140px height
                      width: ScreenConfig.getWidthPercentage(
                          context, 12.5), // Equivalent to 150px width
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 242, 221, 1),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                            'assets/images/jordy_profile_2.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getPadding(context, 15, 2),
                    PlatformView.web => ScreenConfig.getPadding(context, 20, 2),
                  },
                  child: SelectableText(st.aboutMe,
                      style: GoogleFonts.inter(
                        fontSize: platformView == PlatformView.mobile ? 14 : 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                        height: 1.8,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
