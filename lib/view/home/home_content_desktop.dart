import 'package:flutter/material.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_middle_section.dart';
import 'package:jordyhers/widgets/middle_section/community_section.dart';
import 'package:jordyhers/widgets/middle_section/contact_us_section.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';
import 'package:jordyhers/widgets/middle_section/publication_section.dart';
import 'package:jordyhers/widgets/navigation_bar/navigation_bar.dart';
import 'package:jordyhers/widgets/video_section/video_section.dart';

class HomeContentDesktop extends StatefulWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  State<HomeContentDesktop> createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop> {
  final ScrollController itemScrollController = ScrollController();
  Color _appBarBackgroundColor = Colors.black;

  @override
  void initState() {
    super.initState();
    itemScrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    itemScrollController.removeListener(_scrollListener);
    itemScrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final scrollOffset = itemScrollController.offset;

    setState(() {
      if (scrollOffset > 100) {
        _appBarBackgroundColor = Colors.white;
      } else {
        _appBarBackgroundColor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        controller: itemScrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: _appBarBackgroundColor,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            floating: true,
            pinned: true,
            title: CustomNavigationBar(itemScrollController),
          ),
          SliverToBoxAdapter(
            child: HeaderSection(
              PlatformView.web,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: VideoSection(
              PlatformView.web,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: PublicationSection(
              PlatformView.web,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: MiddleSection(
              PlatformView.web,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: AboutMiddleSection(PlatformView.web),
          ),
          SliverToBoxAdapter(
            child: CommunitySection(
              PlatformView.web,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: ContactUsSection(
              PlatformView.web,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: BottomBar(PlatformView.web),
          ),
        ],
      ),
    );
  }
}
