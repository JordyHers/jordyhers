import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class AboutMe extends StatelessWidget {
  final bool isMobile;

  const AboutMe({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: isMobile
                ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                : const EdgeInsets.symmetric(horizontal: 250.0, vertical: 20),
            child: SelectableText(
              'About Me',
              style: TextStyle(
                  fontSize: isMobile ? 22 : 40,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryTextTheme.caption!.color),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: isMobile
                      ? const EdgeInsets.symmetric(horizontal: 60.0)
                      : const EdgeInsets.symmetric(horizontal: 250.0),
                  child: CircleAvatar(
                    radius: isMobile ? 55 : 65,
                    foregroundImage:
                        AssetImage('assets/images/jordy_purple.jpg'),
                  ),
                ),
                Padding(
                  padding: isMobile
                      ? const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 10)
                      : const EdgeInsets.symmetric(
                          horizontal: 250.0, vertical: 20),
                  child: RichText(
                    text: TextSpan(
                        text: st.aboutMe,
                        style: TextStyle(
                            fontSize: isMobile ? 21 : 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
