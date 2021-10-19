import 'package:flutter/material.dart';
import 'package:jordyhers/utils/theme.dart';

class NavBarLogo extends StatelessWidget {
  final bool isMobile;

  const NavBarLogo({Key key, this.isMobile}) : super(key: key);

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
                      fontFamily: 'Montserrat-Regular'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text(
                    "Hers.com",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = Style.subtitle,
                        fontFamily: 'Montserrat-Regular'),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 10),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/stickers/1625471355257.png",
                      height: 54,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Jordy",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Hers.com",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent),
                ),
              ],
            ),
    );
  }
}
