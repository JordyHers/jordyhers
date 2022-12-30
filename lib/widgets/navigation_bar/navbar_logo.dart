import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/routing/route_names.dart';
import 'package:jordyhers/services/navigation_service.dart';
import 'package:jordyhers/utils/config.dart';

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
                Padding(
                  padding: EdgeInsets.only(
                      top: 4.0, right: getWidth(context) * 0.015),
                  child: InkWell(
                    onTap: () {
                      locator<NavigationService>().navigateTo(HomeRoute);
                    },
                    child: ClipOval(
                      child: Image.asset(
                        "assets/png/favicon.png",
                        height: getHeight(context) * 0.05,
                      ),
                    ),
                  ),
                )
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
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryTextTheme.caption!.color,
                  ),
                ),
                SelectableText(
                  "Hers.com",
                  style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent),
                ),
              ],
            ),
    );
  }
}
