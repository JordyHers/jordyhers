import 'package:flutter/material.dart';
import 'package:jordyhers/utils/enums.dart';
import 'package:jordyhers/widgets/bottom_section/bottom_bar_column.dart';
import 'package:jordyhers/widgets/head_section/header_section.dart';
import 'package:jordyhers/widgets/middle_section/about_middle_section.dart';
import 'package:jordyhers/widgets/middle_section/community_section.dart';
import 'package:jordyhers/widgets/middle_section/contact_us_section.dart';
import 'package:jordyhers/widgets/middle_section/middle_section.dart';
import 'package:jordyhers/widgets/middle_section/publication_section.dart';
import 'package:jordyhers/widgets/video_section/video_section.dart';

class HomeContentMobile extends StatefulWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  _HomeContentMobileState createState() => _HomeContentMobileState();
}

class _HomeContentMobileState extends State<HomeContentMobile> {
  final ScrollController itemScrollController = ScrollController();
  Color _appBarBackgroundColor = Colors.transparent;

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
        _appBarBackgroundColor = Colors.transparent;
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
            surfaceTintColor: _appBarBackgroundColor,
            shadowColor: _appBarBackgroundColor,
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: HeaderSection(
              PlatformView.mobile,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: VideoSection(
              PlatformView.mobile,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: PublicationSection(
              PlatformView.mobile,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: MiddleSection(
              PlatformView.mobile,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: AboutMiddleSection(PlatformView.mobile),
          ),
          SliverToBoxAdapter(
            child: CommunitySection(
              PlatformView.mobile,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: ContactUsSection(
              PlatformView.mobile,
              scrollController: itemScrollController,
            ),
          ),
          SliverToBoxAdapter(
            child: BottomBar(PlatformView.mobile),
          ),
        ],
      ),
    );
  }
}
