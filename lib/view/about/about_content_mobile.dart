import 'package:flutter/material.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/about_header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_middle_section.dart';

class AboutContentMobile extends StatelessWidget {
  const AboutContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AboutHeaderSection(isMobile: true),
            AboutMiddleSection(isMobile: true),
            BottomBar(isMobile: true)
          ],
        ),
      ),
    );
  }
}
