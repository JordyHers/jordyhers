import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/locator.dart';
import 'package:jordyhers/routing/route_names.dart';
import 'package:jordyhers/services/navigation_service.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:provider/provider.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatefulWidget {
  NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  _NavigationBarTabletDesktopState createState() =>
      _NavigationBarTabletDesktopState();
}

class _NavigationBarTabletDesktopState
    extends State<NavigationBarTabletDesktop> {
  List<Color> colors = [Colors.grey, Colors.grey, Colors.grey];
  List<String> strings = ["Home", "About",];
  Color color = Colors.transparent;
  Color color2 = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context, listen: false);
    return Container(

      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NavBarLogo(isMobile: false),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i <= 1; i++)
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      colors[i] = Colors.white;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      colors[i] = Colors.grey;
                    });
                  },
                  child: TextButton(
                      onPressed: () {
                      if (strings[i] == 'About') {
                          locator<NavigationService>()
                              .navigateTo(AboutRoute);
                        } else if (strings[i] == 'Home') {
                          locator<NavigationService>()
                              .navigateTo(HomeRoute);
                        } else {
                          print('${strings[i]} was Tapped');
                        }
                      },
                      child: FittedBox(
                        child: Text(strings[i],
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              color: colors[i],
                              fontWeight: FontWeight.w600,
                            )),
                      )),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  color = Colors.grey.withOpacity(0.3);
                });
              },
              onExit: (_) {
                setState(() {
                  color = Colors.transparent;
                });
              },
              child: InkWell(
                onTap: () => repository.launchUrl(st.linkedIn),
                child: Container(
                  decoration:
                  BoxDecoration(color: color, shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/png/linkedin.png',
                    height: 30,
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  color2 = Colors.grey.withOpacity(0.3);
                });
              },
              onExit: (_) {
                setState(() {
                  color2 = Colors.transparent;
                });
              },
              child: InkWell(
                onTap: () => repository.launchUrl(st.github),
                child: Container(
                  decoration:
                      BoxDecoration(color: color2, shape: BoxShape.circle),
                  child: Image.asset(
                    'assets/png/pngegg-9.png',
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            iconSize: 17,
            onPressed: () {
              EasyDynamicTheme.of(context).changeTheme();
            },
          )
        ],
      ),
    );
  }
}
