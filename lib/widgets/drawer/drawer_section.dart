import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    'Resume',
    'About',
    'LinkedIn'
  ];

  @override
  _DrawerSectionState createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context, listen: false);
    List<IconButton> icons = [
      IconButton(
        icon: Icon(Icons.home),
        color: Theme.of(context).iconTheme.color,
        onPressed: (){
          Navigator.pop(context);
          locator<NavigationService>()
              .navigateTo(HomeRoute);
        },
      ),
      IconButton(
        icon: Icon(Icons.file_download),
        onPressed: (){
          Navigator.pop(context);
          repository.downloadFile(st.cvPath);
        },
        color: Theme.of(context).iconTheme.color,
      ),
      IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: (){
          Navigator.pop(context);
          locator<NavigationService>()
              .navigateTo(AboutRoute);
        },
        color: Theme.of(context).iconTheme.color,
      ),
      IconButton(
        icon: Icon(Icons.work_outline),
        onPressed: (){
          Navigator.pop(context);
          repository.launchUrl(st.linkedIn);
        },
        color: Theme.of(context).iconTheme.color,
      ),
    ];


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
                    backgroundImage: AssetImage('assets/png/favicon.png'),
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
            SizedBox(height: getHeight(context) / 35),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
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
                                repository.downloadFile(st.cvPath);
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
                                style: GoogleFonts.inter(
                                    color: Theme.of(context)
                                        .primaryTextTheme
                                        .caption!
                                        .color)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context) / 30,
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
