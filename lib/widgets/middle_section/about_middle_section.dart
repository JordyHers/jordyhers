import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class AboutMiddleSection extends StatelessWidget {
  final bool isMobile;

  const AboutMiddleSection({Key? key, required this.isMobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: isMobile
              ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
              : const EdgeInsets.symmetric(horizontal: 250.0, vertical: 20),
          child: SelectableText(
            'About Me',
            style: GoogleFonts.inter(
                fontSize: isMobile ? 22 : 30,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryTextTheme.caption!.color),
          ),
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0,vertical: 50)
                    : const EdgeInsets.symmetric(horizontal: 250.0),
                child: FittedBox(
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/big_yellow.png')
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    :  EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20, vertical: 20),
                child:  SelectableText(
                      st.aboutMe,
                      style: GoogleFonts.inter(
                          letterSpacing: 1,
                          fontSize: isMobile ? 14 : 15,
                          fontWeight: FontWeight.w300,
                          height: 1.8,
                          color: Colors.grey.shade500)),

              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    :  EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20, vertical: 20),
                child: SelectableText(
                  'Why Flutter ?',
                  style: GoogleFonts.inter(
                      fontSize: isMobile ? 22 : 30,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryTextTheme.caption!.color),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30)
                    :  EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20, vertical: 70),
                child:  SelectableText(
                       st.why_flutter,
                      style: GoogleFonts.inter(
                          fontSize: isMobile ? 14 : 15,
                          fontWeight: FontWeight.w300,
                          height: 1.8,
                          color: Colors.grey.shade500)),

              ),
            ],
          ),
        ),
      ],
    );
  }
}
