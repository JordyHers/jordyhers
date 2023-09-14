import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/config.dart';
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
                ? EdgeInsets.symmetric(
                    horizontal: getWidth(context) * 0.10,
                    vertical: getHeight(context) * 0.02)
                : EdgeInsets.symmetric(
                    horizontal: getWidth(context) * 0.20, vertical: 20),
            child: SelectableText(
              'About Me',
              style: GoogleFonts.inter(
                  fontSize: isMobile ? 22 : 40,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryTextTheme.caption!.color),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: isMobile
                      ? EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 0.10,
                          vertical: getHeight(context) * 0.02)
                      : EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 0.20),
                  child: FittedBox(
                    child: Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(252, 242, 221, 1),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                            'assets/images/jordy_profile_2.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: isMobile
                      ? const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 10)
                      : EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 0.20, vertical: 20),
                  child: SelectableText(st.aboutMe,
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 14 : 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade500,
                        height: 1.8,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
