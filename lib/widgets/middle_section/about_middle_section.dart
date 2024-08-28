import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:jordyhers/utils/enums.dart';

class AboutMiddleSection extends StatelessWidget {
  final PlatformView platformView;

  const AboutMiddleSection(
    this.platformView, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 16.0;
    final double LargePadding = 150.0;
    final double headerBottomPadding = 10.0;

    final double horizontalPadding = switch (platformView) {
      PlatformView.mobile => 10.0,
      PlatformView.web => ScreenConfig.getWidth(context) * 0.15,
    };

    final double titleFontSize = switch (platformView) {
      PlatformView.mobile => 22.0,
      PlatformView.web => 35,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: LargePadding,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: SelectableText(
            'About Me',
            style: GoogleFonts.lora(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: FittedBox(
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(252, 242, 221, 1),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage('assets/images/jordy_profile_2.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: SizedBox(
                  width: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getWidthPercentage(context, 80),
                    PlatformView.web =>
                      ScreenConfig.getWidthPercentage(context, 40),
                  },
                  child: SelectableText(
                    st.aboutMe,
                    style: GoogleFonts.lora(
                      fontSize: switch (platformView) {
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
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: horizontalPadding,
                    right: horizontalPadding,
                    bottom: headerBottomPadding),
                child: SelectableText(
                  'Education',
                  style: GoogleFonts.lora(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Container(
                  height: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getHeight(context) * 0.35,
                    PlatformView.web => ScreenConfig.getHeight(context) * 0.35,
                  },
                  width: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getWidthPercentage(context, 80),
                    PlatformView.web =>
                      ScreenConfig.getWidthPercentage(context, 40),
                  },
                  child: ListView.builder(
                    itemCount: st.education.length,
                    itemBuilder: (builder, index) => ComponentView(
                      platformView: platformView,
                      title: st.education[index].title,
                      description: st.education[index].description,
                      period: st.education[index].period,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: horizontalPadding,
                    right: horizontalPadding,
                    bottom: headerBottomPadding),
                child: SelectableText(
                  'Experience',
                  style: GoogleFonts.lora(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: Container(
                  height: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getHeight(context) * 0.35,
                    PlatformView.web => ScreenConfig.getHeight(context) * 0.55,
                  },
                  width: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getWidthPercentage(context, 80),
                    PlatformView.web =>
                      ScreenConfig.getWidthPercentage(context, 40),
                  },
                  child: ListView.builder(
                    itemCount: st.experienceList.length,
                    itemBuilder: (builder, index) => ComponentView(
                      platformView: platformView,
                      title: st.experienceList[index].title,
                      description: st.experienceList[index].description,
                      period: st.experienceList[index].period,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 50,
                    left: horizontalPadding,
                    right: horizontalPadding,
                    bottom: headerBottomPadding),
                child: SelectableText(
                  'Why Flutter?',
                  style: GoogleFonts.lora(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: horizontalPadding,
                  left: horizontalPadding,
                  bottom: 50,
                ),
                child: SizedBox(
                  width: switch (platformView) {
                    PlatformView.mobile =>
                      ScreenConfig.getWidthPercentage(context, 80),
                    PlatformView.web =>
                      ScreenConfig.getWidthPercentage(context, 40),
                  },
                  child: SelectableText(
                    st.why_flutter,
                    style: GoogleFonts.lora(
                      fontSize: switch (platformView) {
                        PlatformView.mobile => 14,
                        PlatformView.web => 17,
                      },
                      fontWeight: FontWeight.w400,
                      height: 1.8,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ComponentView extends StatelessWidget {
  final String title;
  final String period;
  final String? url;
  final String description;
  final PlatformView platformView;

  const ComponentView({
    Key? key,
    required this.platformView,
    required this.title,
    required this.period,
    required this.description,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Flexible(
                child: SelectableText(
                  title,
                  style: GoogleFonts.lora(
                    fontSize: switch (platformView) {
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
            ],
          ),
          Row(
            children: [
              Flexible(
                child: SelectableText(
                  description,
                  style: GoogleFonts.lora(
                    fontSize: switch (platformView) {
                      PlatformView.mobile => 14,
                      PlatformView.web => 17,
                    },
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade800,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Text(period,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lora(
                      fontSize: switch (platformView) {
                        PlatformView.mobile => 14,
                        PlatformView.web => 17,
                      },
                      fontWeight: FontWeight.w300,
                      height: 1.8,
                      color: Colors.grey.shade500)),
            ],
          ),
        ],
      ),
    );
  }
}
