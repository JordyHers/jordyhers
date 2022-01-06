import 'package:flutter/material.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_me.dart';
import 'package:jordyhers/widgets/middle_section/email_us_section.dart';
import 'package:jordyhers/widgets/middle_section/logos_sections.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: USE BLOCK TO CONTROL THE DIFFERENT PAGES
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderSection(isMobile: false),
            MiddleSection(isMobile: false),
            AboutMe(isMobile: false),
            //SizedBox(height: getHeight(context) * 0.05),
            LogoSection(isMobile: false),
            EmailUs(isMobile: false),
            BottomBar(isMobile: false)
          ],
        ),
      ),
    );
  }
}
