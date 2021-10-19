import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';

class AboutMe extends StatelessWidget {
  final bool isMobile;

  const AboutMe({Key key, this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: isMobile
                  ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20)
                  : const EdgeInsets.symmetric(horizontal: 350.0, vertical: 20),
              child: Text(
                'About Me',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              height: isMobile
                  ? getHeight(context) * 0.55
                  : getHeight(context) * 0.45,
              width: getWidth(context),
              child: Stack(
                children: [
                  Padding(
                    padding: isMobile
                        ? const EdgeInsets.symmetric(horizontal: 60.0)
                        : const EdgeInsets.symmetric(horizontal: 350.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: isMobile ? 55 : 65,
                        foregroundImage:
                            AssetImage('assets/images/jordy_purple.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: isMobile
                        ? const EdgeInsets.symmetric(
                            horizontal: 60.0, vertical: 50)
                        : const EdgeInsets.symmetric(horizontal: 350.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: RichText(
                        text: TextSpan(
                            text:
                                "I'm Jordy Hershel IGONDJO,\n\n I'm a Flutter GDE and I've been writing code professionally for over 12 years. "
                                "I've been a mobile app developer since 2012, working for startups, agencies, and big companies."
                                "With my Flutter tutorials and courses, I've helped thousands of students become better developers."
                                "   I know what it takes to become a good Flutter developer. I can't wait to share this email course with you and help you fast-track your learning.",
                            style: TextStyle(
                                fontSize: isMobile ? 18 : 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
