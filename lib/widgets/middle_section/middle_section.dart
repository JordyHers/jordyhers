import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class MiddleSection extends StatelessWidget {
  final bool isMobile;

  const MiddleSection({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: isMobile
              ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 60)
              : const EdgeInsets.symmetric(horizontal: 100.0, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isMobile
                  ? Text('Flutter | iOS | React Native',
                  style: GoogleFonts.merriweather(
                        fontSize: isMobile ? 25 : 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade700,
                      ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(),
                        Text('Flutter',
                            style: GoogleFonts.merriweather(
                              fontSize: isMobile ? 25 : 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                            )),
                        SizedBox(width: 20),
                        FlutterLogo(size: 35),
                        SizedBox(width: 20),
                        Text('iOS SwiftUI',
                            style: GoogleFonts.merriweather(
                              fontSize: isMobile ? 25 : 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                            )),
                        SizedBox(width: 20),
                        Image.asset("assets/png/pngegg-13.png", height: 35),
                        SizedBox(width: 20),
                        Text('React Native',
                            style: GoogleFonts.merriweather(
                              fontSize: isMobile ? 25 : 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade700,
                            )),
                        SizedBox(width: 20),
                        Image.asset("assets/png/pngegg-10.png", height: 35),
                        Spacer(),
                      ],
                    ),
              SizedBox(height: isMobile ? 20 : getHeight(context) * 0.15),
              Text('For all your mobile application projects.',
                  style: TextStyle(
                    fontSize: isMobile ? 23 : 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.purpleAccent,
                  )),
              SizedBox(height: 40),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.all(0.0)
                    : const EdgeInsets.symmetric(horizontal: 200.0),
                child: RichText(
                  text: TextSpan(
                      text:
                          "Flutter is amazing. But it can also be intimidating."
                          "With thousands of packages on pub.dev, over 400 widgets in the Flutter SDK, and over 40 state management solutions, where do you even start?\n\n"
                          "Would you like to get a curated list of resources, guiding you through the most important topics, and helping you choose the right tools and packages?"
                          " Would you like to become more productive and take your Flutter apps to the next level?"
                          " I know I would.",
                      style: GoogleFonts.merriweather(
                        fontSize: isMobile ? 14 : 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                        height: 1.5,
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                height: isMobile
                    ? getHeight(context) * 0.35
                    : getHeight(context) * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: isMobile
                        ? DecorationImage(
                            image: NetworkImage(st.flutter_address_image),
                          )
                        : DecorationImage(
                            image: AssetImage(
                              'assets/images/swiftui_macbook.png',
                            ),
                          )))),
      ],
    );
  }
}
