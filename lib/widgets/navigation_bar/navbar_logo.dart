import 'package:flutter/material.dart';
import 'package:jordyhers/routing/route_names.dart';
import 'package:jordyhers/services/navigation_service.dart';

import '../../locator.dart';

class NavBarLogo extends StatelessWidget {
  final bool isMobile;

  const NavBarLogo({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: cached_network_image to enable easy access to image after has been displayed
    return Expanded(
      child: isMobile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Opacity(
                    opacity: 0,
                  ),
                ),
                Text(
                  "Jordy",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryTextTheme.caption!.color,
                      fontFamily: 'Montserrat-Regular'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text(
                    "Hers.com",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        color: Colors.purpleAccent,
                        fontFamily: 'Montserrat-Regular'),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 20),
                  child: InkWell(
                    onTap: () {
                      locator<NavigationService>().navigateTo(HomeRoute);
                      print('Home logo tapped');
                    },
                    child: ClipOval(
                      child: Image.asset(
                        "assets/png/favicon.png",
                        height: 54,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SelectableText(
                  "Jordy",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryTextTheme.caption!.color,
                  ),
                ),
                SelectableText(
                  "Hers.com",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent),
                ),
              ],
            ),
    );
  }
}
