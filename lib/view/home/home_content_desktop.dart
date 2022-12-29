import 'package:flutter/material.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_me.dart';
import 'package:jordyhers/widgets/middle_section/email_us_section.dart';
import 'package:jordyhers/widgets/middle_section/logos_sections.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';
import 'package:jordyhers/widgets/portfolio_section/portofolio_section.dart';
import 'package:jordyhers/widgets/video_section/video_section.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderSection(isMobile: false),
            MiddleSection(isMobile: false),
            VideoSection(isMobile: false),
            AboutMe(isMobile: false),
            LogoSection(isMobile: false),
            EmailUs(isMobile: false),
            BottomBar(isMobile: false)
          ],
        ),
      ),
    );
  }
}
