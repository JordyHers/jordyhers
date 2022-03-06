import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class AboutMiddleSection extends StatelessWidget {
  final bool isMobile;

  const AboutMiddleSection({Key? key, required this.isMobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: isMobile
              ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
              : const EdgeInsets.symmetric(horizontal: 250.0, vertical: 20),
          child: SelectableText(
            'About Me',
            style: GoogleFonts.merriweather(
                fontSize: isMobile ? 22 : 30,
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
                  radius: isMobile ? 55 : 75,
                  foregroundImage: AssetImage('assets/images/jordy_purple.jpg'),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    : const EdgeInsets.symmetric(
                        horizontal: 250.0, vertical: 20),
                child: RichText(
                  text: TextSpan(
                      text: st.aboutMe,
                      style: GoogleFonts.merriweather(
                          letterSpacing: 1,
                          fontSize: isMobile ? 14 : 15,
                          fontWeight: FontWeight.w300,
                          height: 1.9,
                          color: Colors.grey.shade500)),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    : const EdgeInsets.symmetric(
                        horizontal: 250.0, vertical: 20),
                child: SelectableText(
                  'Why Flutter ?',
                  style: GoogleFonts.merriweather(
                      fontSize: isMobile ? 22 : 30,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryTextTheme.caption!.color),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30)
                    : const EdgeInsets.symmetric(
                        horizontal: 250.0, vertical: 70),
                child: RichText(
                  text: TextSpan(
                      text: st.why_flutter,
                      style: GoogleFonts.merriweather(
                          fontSize: isMobile ? 14 : 15,
                          fontWeight: FontWeight.w300,
                          height: 1.9,
                          color: Colors.grey.shade500)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
