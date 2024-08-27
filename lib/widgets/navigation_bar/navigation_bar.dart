import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'navigation_bar_mobile.dart';
import 'navigation_bar_tablet_desktop.dart';

class CustomNavigationBar extends StatelessWidget {
  final ItemScrollController scrollController;

  const CustomNavigationBar(this.scrollController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (final _) => NavigationBarMobile(scrollController),
      tablet: (final _) => NavigationBarMobile(scrollController),
      desktop: (final _) => NavigationBarTabletDesktop(scrollController),
    );
  }
}
