import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:jordyhers/routing/route_names.dart';
import 'package:jordyhers/services/navigation_service.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:provider/provider.dart';

import '../../locator.dart';

class DrawerSection extends StatefulWidget {
  DrawerSection({Key? key}) : super(key: key);

  static const List<String> sections = [
    'Home',
    'Portfolio',
    'About',
    'LinkedIn'
  ];

  @override
  _DrawerSectionState createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  @override
  Widget build(BuildContext context) {
    List<Icon> icons = [
      Icon(
        Icons.home,
        color: Theme.of(context).iconTheme.color,
      ),
      Icon(
        Icons.wallet_membership,
        color: Theme.of(context).iconTheme.color,
      ),
      Icon(
        Icons.info_outline,
        color: Theme.of(context).iconTheme.color,
      ),
      Icon(
        Icons.work_outline,
        color: Theme.of(context).iconTheme.color,
      ),
    ];

    final repository = Provider.of<Http>(context, listen: false);
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: getHeight(context),
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Container(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/png/logo.png'),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.brightness_6),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                EasyDynamicTheme.of(context).changeTheme();
              },
            ),
            SizedBox(
              height: getHeight(context) / 25,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: ListTile(
                          leading: icons[index],
                          title: TextButton(
                            onPressed: () {
                              if (index == 0) {
                                Navigator.pop(context);
                                locator<NavigationService>()
                                    .navigateTo(HomeRoute);
                              } else if (index == 1) {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Download Portfolio',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                color: Colors.purpleAccent)),
                                        content: Text(
                                          'Thank you for your interest, the portfolio page is not completed yet, we plan to finish up soon.\n '
                                          'Meanwhile you can download my portfolio (PDF version)\n\n',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Close',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ))),
                                          TextButton(
                                              onPressed: () {
                                                repository.downloadFile(
                                                    st.documentPath);
                                                Navigator.pop(context);
                                              },
                                              child: Text('Download',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                  ))),
                                        ],
                                      );
                                    });
                              } else if (index == 2) {
                                Navigator.pop(context);
                                locator<NavigationService>()
                                    .navigateTo(AboutRoute);
                              } else if (index == 3) {
                                Navigator.pop(context);
                                repository.launchUrl(st.linkedIn);
                              }
                            },
                            child: Text(DrawerSection.sections[index],
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .caption!
                                        .color)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context) / 20,
                      ),
                    ],
                  );
                }),
            InkWell(
              onTap: () => repository.launchUrl(st.github),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).iconTheme.color,
                    shape: BoxShape.circle),
                child: Image.asset(
                  'assets/png/pngegg-9.png',
                  height: 54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
