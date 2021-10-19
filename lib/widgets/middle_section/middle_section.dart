import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class MiddleSection extends StatelessWidget {
  final bool isMobile;

  const MiddleSection({
    Key key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Find your flutter expert for your projects and design ',
                  style: TextStyle(
                    fontSize: isMobile ? 25 : 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade700,
                  )),
              Text('for both back-end and front-end.',
                  style: TextStyle(
                    fontSize: isMobile ? 23 : 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.purpleAccent,
                  )),
              SizedBox(height: 40),
              RichText(
                text: TextSpan(
                    text:
                        "Flutter is amazing. But it can also be intimidating.\n\n"
                        "With thousands of packages on pub.dev, over 400 widgets in the Flutter SDK, and over 40 state management solutions, where do you even start?\n\n"
                        "Would you like to get a curated list of resources, guiding you through the most important topics, and helping you choose the right tools and packages?"
                        " Would you like to become more productive and take your Flutter apps to the next level?"
                        "I know I would.",
                    style: TextStyle(
                      fontSize: isMobile ? 21 : 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    )),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            height: getHeight(context) * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(st.macBook_address_subtitle),
                    //image: AssetImage('assets/images/head_banner.png'),
                    fit: isMobile ? BoxFit.cover : BoxFit.fitWidth)),
          ),
        ),
      ],
    );
  }
}
