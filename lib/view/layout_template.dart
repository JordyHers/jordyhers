import 'package:flutter/material.dart';
import 'package:jordyhers/routing/route_names.dart';
import 'package:jordyhers/routing/router.dart';
import 'package:jordyhers/services/navigation_service.dart';
import 'package:jordyhers/widgets/centered_view/centered_view.dart';
import 'package:jordyhers/widgets/drawer/drawer_section.dart';
import 'package:jordyhers/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../locator.dart';

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? DrawerSection()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              CustomNavigationBar(),
              Expanded(
                child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: (settings) => generateRoute(settings),
                  initialRoute: HomeRoute,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
