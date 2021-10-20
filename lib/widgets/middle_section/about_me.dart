import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';

class AboutMe extends StatelessWidget {
  final bool isMobile;

  const AboutMe({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: isMobile
                  ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                  : const EdgeInsets.symmetric(horizontal: 350.0, vertical: 20),
              child: SelectableText(
                'About Me',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).primaryTextTheme.caption!.color),
              ),
            ),
            Container(
              height: isMobile
                  ? getHeight(context) * 0.55
                  : getHeight(context) * 0.55,
              width: getWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: isMobile
                        ? const EdgeInsets.symmetric(horizontal: 60.0)
                        : const EdgeInsets.symmetric(horizontal: 350.0),
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
                        : const EdgeInsets.symmetric(horizontal: 350.0),
                    child: RichText(
                      text: TextSpan(
                          //TODO: BUG NOT RESPONSIVE
                          text:
                              "I'm Jordy Hershel IGONDJO,\n\n I'm a Flutter GDE and I've been writing code professionally for over 12 years. "
                              "I've been a mobile app developer since 2012, working for startups, agencies, and big companies."
                              "With my Flutter tutorials and courses, I've helped thousands of students become better developers."
                              "   I know what it takes to become a good Flutter developer. I can't wait to share this email course with you and help you fast-track your learning.",
                          style: TextStyle(
                              fontSize: isMobile ? 17 : 21,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
