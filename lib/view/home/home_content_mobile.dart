import 'package:flutter/material.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/drawer/drawer_section.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_middle_section.dart';
import 'package:jordyhers/widgets/middle_section/email_us_section.dart';
import 'package:jordyhers/widgets/middle_section/logos_sections.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';
import 'package:jordyhers/widgets/middle_section/publication_section.dart';
import 'package:jordyhers/widgets/video_section/video_section.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemScrollController itemScrollController = ItemScrollController();

    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerSection(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(children: [
        ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemCount: 8,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return HeaderSection(
                  PlatformView.mobile,
                  scrollController: itemScrollController,
                );
              case 1:
                return VideoSection(
                  PlatformView.mobile,
                );
              case 2:
                return PublicationSection(
                  PlatformView.mobile,
                  scrollController: itemScrollController,
                );
              case 3:
                return MiddleSection(
                  PlatformView.mobile,
                  scrollController: itemScrollController,
                );

              case 4:
                return AboutMiddleSection(
                  PlatformView.mobile,
                );

              case 5:
                return CommunitySection(
                  PlatformView.mobile,
                );
              case 6:
                return EmailUs(
                  PlatformView.mobile,
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
      ]),
    );
  }
}
