import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/routing/route_names.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NavigationBarTabletDesktop extends StatefulWidget {
  final ItemScrollController scrollController;
  NavigationBarTabletDesktop(this.scrollController, {Key? key})
      : super(key: key);

  @override
  _NavigationBarTabletDesktopState createState() =>
      _NavigationBarTabletDesktopState();
}

class _NavigationBarTabletDesktopState extends State<NavigationBarTabletDesktop>
    with SingleTickerProviderStateMixin {
  double _opacity = 1.0;

  final Map<String, dynamic> navigationItems = {
    "Home": 0,
    "Apps & Packages": 2,
    "Book Session": 3,
    "About": 4,
    "Community": 5,
    "LinkedIn": LinkedInRoute,
    "Github": GithubRoute,
  };
  final Map<String, Color> colors = {
    "Home": Colors.grey,
    "About": Colors.grey,
    "Book Session": Colors.grey,
    "Community": Colors.grey,
    "Apps & Packages": Colors.grey,
    "LinkedIn": Colors.grey,
    "Github": Colors.grey,
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context, listen: false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Opacity(
          opacity: _opacity,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_opacity),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            height: 80,
            width: constraints.maxWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: navigationItems.keys.map((label) {
                    return MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          colors[label] = Theme.of(context).primaryColor;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          colors[label] = Colors.grey;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextButton(
                          onPressed: () {
                            if (label == 'LinkedIn' || label == 'Github') {
                              repository.launchURL(navigationItems[label]!);
                            } else {
                              widget.scrollController.scrollTo(
                                index: navigationItems[label]! as int,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeOut,
                              );
                            }
                          },
                          child: Text(
                            label,
                            style: GoogleFonts.lora(
                              fontSize: 14,
                              color: colors[label],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                GestureDetector(
                  onTap: () => repository.launchURL(discordLink),
                  child: Icon(
                    Icons.discord,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
