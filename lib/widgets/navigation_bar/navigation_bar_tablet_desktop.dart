import 'package:flutter/material.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatefulWidget {
  NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  _NavigationBarTabletDesktopState createState() =>
      _NavigationBarTabletDesktopState();
}

class _NavigationBarTabletDesktopState
    extends State<NavigationBarTabletDesktop> {
  List<Color> colors = [Colors.grey, Colors.grey, Colors.grey, Colors.grey];
  List<String> strings = ["Home", "Portfolio", "About", "LinkedIn"];
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<Http>(context, listen: false);
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(isMobile: false),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (int i = 0; i <= 3; i++)
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
                      child: FlatButton(
                          onPressed: () {
                            if (strings[i] == 'LinkedIn') {
                              repository.launchUrl(st.linkedIn);
                            } else {
                              print('Button Tapped');
                            }
                          },
                          child: Text(strings[i],
                              style: TextStyle(
                                fontSize: 13,
                                color: colors[i],
                                fontWeight: FontWeight.w700,
                              ))),
                    ),
                ],
              ),
              MouseRegion(
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
                  onTap: () => repository.launchUrl(st.github),
                  child: Container(
                    decoration:
                        BoxDecoration(color: color, shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/png/pngegg-9.png',
                      height: 54,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
