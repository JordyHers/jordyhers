import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:jordyhers/utils/theme.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/email_us_section.dart';
import 'package:jordyhers/widgets/middle_section/logos_sections.dart';
import 'package:jordyhers/widgets/middle_section/about_me.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USE BLOCK TO CONTROL THE DIFFERENT PAGES
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderSection(),
            MiddleSection(isMobile: false),
            AboutMe(isMobile: false),
            SizedBox(height: getHeight(context) * 0.15),
            LogoSection(isMobile: false),
            EmailUs(isMobile: false),
            BottomBar(isMobile: false)
          ],
        ),
      ),
    );
  }
}
