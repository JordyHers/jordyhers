import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:jordyhers/utils/theme.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/lower_section.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/stickers/404Error.png",
                    height: 350,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
