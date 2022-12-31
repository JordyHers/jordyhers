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
                fontWeight: FontWeight.w700,
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
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 50)
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
                          image: AssetImage('assets/images/jordy_about.jpg')),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20, vertical: 20),
                child: SelectableText(st.aboutMe,
                    style: GoogleFonts.inter(
                        letterSpacing: 0.5,
                        fontSize: isMobile ? 14 : 15,
                        fontWeight: FontWeight.w300,
                        height: 1.8,
                        color: Colors.grey.shade500)),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20, vertical: 20),
                child: SelectableText(
                  'Education',
                  style: GoogleFonts.inter(
                      fontSize: isMobile ? 22 : 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryTextTheme.caption!.color),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20,
                        vertical: getHeight(context) * 0.05),
                child: Container(
                  height: isMobile
                      ? getHeight(context) * 0.35
                      : getHeight(context) * 0.55,
                  child: ListView.builder(
                      itemCount: st.education.length,
                      itemBuilder: (builder, index) => ComponentView(
                            isMobile: isMobile,
                            title: st.education[index].title,
                            description: st.education[index].description,
                            period: st.education[index].period,
                          )),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20,
                        vertical: getHeight(context) * 0.005),
                child: SelectableText(
                  'Experience',
                  style: GoogleFonts.inter(
                      fontSize: isMobile ? 22 : 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryTextTheme.caption!.color),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20,
                      ),
                child: Container(
                  height: isMobile
                      ? getHeight(context) * 1.15
                      : getHeight(context) * 1.30,
                  child: ListView.builder(
                      itemCount: st.experienceList.length,
                      itemBuilder: (builder, index) => ComponentView(
                            isMobile: isMobile,
                            title: st.experienceList[index].title,
                            description: st.experienceList[index].description,
                            period: st.experienceList[index].period,
                            url: st.experienceList[index].imageUrl,
                          )),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20,
                        vertical: getHeight(context) * 0.05),
                child: SelectableText(
                  'Why Flutter ?',
                  style: GoogleFonts.inter(
                      fontSize: isMobile ? 22 : 30,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryTextTheme.caption!.color),
                ),
              ),
              Padding(
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.20, vertical: 70),
                child: SelectableText(st.why_flutter,
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

class ComponentView extends StatelessWidget {
  final String title;
  final String period;
  final String? url;
  final String description;
  final bool isMobile;

  const ComponentView({
    Key? key,
    required this.isMobile,
    required this.title,
    required this.period,
    required this.description,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (url != null && url!.isNotEmpty)
              Container(
                margin: isMobile
                    ? EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.025)
                    : EdgeInsets.symmetric(
                        horizontal: getWidth(context) * 0.020),
                height: getHeight(context) * 0.12,
                width: getWidth(context) * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  //borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(url!),
                  ),
                ),
              )
            else ...[
              SizedBox.shrink(),
              SizedBox.shrink(),
            ],
            Flexible(
              child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      fontSize: getHeight(context) * 0.020,
                      fontWeight: FontWeight.w700,
                      height: 1.8,
                      color: Colors.deepPurple.shade300)),
            ),
            SizedBox.shrink(),
            SizedBox.shrink(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox.shrink(),
            Flexible(
              child: Text(description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                      fontSize: getHeight(context) * 0.018,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                      color: Colors.grey.shade500)),
            ),
            SizedBox.shrink(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox.shrink(),
            Text(period,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: getHeight(context) * 0.017,
                    fontWeight: FontWeight.w300,
                    height: 1.8,
                    color: Colors.grey.shade500)),
            SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
