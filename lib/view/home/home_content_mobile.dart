import 'package:flutter/material.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/email_us_section.dart';
import 'package:jordyhers/widgets/middle_section/logos_sections.dart';
import 'package:jordyhers/widgets/middle_section/about_me.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USE BLOCK TO CONTROL THE DIFFERENT PAGES
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            MiddleSection(isMobile: true),
            AboutMe(isMobile: true),
            LogoSection(isMobile: true),
            EmailUs(isMobile: true),
            BottomBar(isMobile: true)
          ],
        ),
      ),
    );
  }
}
