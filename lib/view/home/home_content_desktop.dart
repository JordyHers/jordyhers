import 'package:flutter/material.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_middle_section.dart';
import 'package:jordyhers/widgets/middle_section/email_us_section.dart';
import 'package:jordyhers/widgets/middle_section/logos_sections.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';
import 'package:jordyhers/widgets/middle_section/publication_section.dart';
import 'package:jordyhers/widgets/navigation_bar/navigation_bar.dart';
import 'package:jordyhers/widgets/video_section/video_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeContentDesktop extends StatefulWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(children: [
        ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemCount: 8,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return HeaderSection(
                  PlatformView.web,
                  scrollController: itemScrollController,
                );
              case 1:
                return VideoSection(
                  PlatformView.web,
                );
              case 2:
                return PublicationSection(
                  PlatformView.web,
                  scrollController: itemScrollController,
                );
              case 3:
                return MiddleSection(
                  PlatformView.web,
                  scrollController: itemScrollController,
                );

              case 4:
                return AboutMiddleSection(
                  PlatformView.web,
                );

              case 5:
                return CommunitySection(
                  PlatformView.web,
                );
              case 6:
                return EmailUs(
                  PlatformView.web,
                );
              case 7:
                return BottomBar(
                  PlatformView.web,
                );
              default:
                return SizedBox.shrink();
            }
          },
          physics: BouncingScrollPhysics(),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: CustomNavigationBar(itemScrollController),
        ),
      ]),
    );
  }
}
