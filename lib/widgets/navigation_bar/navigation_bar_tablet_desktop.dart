import 'package:flutter/material.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.indigo,
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
                  FlatButton(
                      onPressed: () {},
                      child: Text("Discover",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  FlatButton(
                      onPressed: () {},
                      child: Text("Our Blog",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  FlatButton(
                      onPressed: () {},
                      child: Text("Services",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  FlatButton(
                      onPressed: () {},
                      child: Text("About US",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                ],
              ),
              // SizedBox(
              //   width: 60,
              // ),
              // NavBarItem('About Us', AboutRoute, false),
            ],
          )
        ],
      ),
    );
  }
}
