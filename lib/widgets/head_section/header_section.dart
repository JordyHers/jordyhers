import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  final bool isMobile;
  HeaderSection({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  List<String> images = [
    "assets/images/jordy_about.jpg",
    "assets/images/jordy_about.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context, listen: false);
    return Container(
      height: getHeight(context) * 0.85,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            left: 0,
            right: 0,
            top: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobile
                    ? Container()
                    : Padding(
                        padding: isMobile
                            ? const EdgeInsets.symmetric(horizontal: 8.0)
                            : EdgeInsets.symmetric(
                                horizontal: getWidth(context) * 0.10),
                        child: Text("Hello, I'm ",
                            style: GoogleFonts.pacifico(
                              fontSize: getHeight(context) * 0.08,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .caption!
                                  .color,
                            )),
                      ),
                isMobile
                    ? SizedBox.shrink()
                    : Padding(
                        padding: isMobile
                            ? const EdgeInsets.symmetric(horizontal: 8.0)
                            : EdgeInsets.symmetric(
                                horizontal: getWidth(context) * 0.10),
                        child: Text("Jordy Hershel. 🚀 ",
                            style: GoogleFonts.pacifico(
                              fontSize: getHeight(context) * 0.08,
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                SizedBox(height: 40),
                isMobile
                    ? SizedBox.shrink()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(context) * 0.10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: getWidth(context) / 3,
                              child: SelectableText(
                                  'Find your developer expert for all your projects and design for both back-end and front-end.Handle simple and complex projects using the latest tools and '
                                  'the fastest growing platforms such as React Native and Flutter. '
                                  'Your expert can also provide counseling to your dev teams. You can find me on Upwork for Freelance projects.',
                                  style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700,
                                      height: 1.5)),
                            ),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () {
                                repository.downloadFile(st.cvPath);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'Download CV',
                                    style:
                                        GoogleFonts.inter(color: Colors.white),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Icon(Icons.download)
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  side: BorderSide(
                                    width: 2.0,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
              ],
            ),
          ),
          isMobile
              ? Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                    scale: getWidth(context) * 20 / 10000,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getWidth(context) * 0.05),
                        child: ClipOval(
                          child: Image.asset(
                            images[1],
                            height: getHeight(context) * 0.40,
                          ),
                        )),
                  ),
                )
              : Align(
                  alignment: Alignment.topRight,
                  child: Transform.scale(
                    scale: getWidth(context) * 7 / 10000,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getHeight(context) * 0.10,
                          horizontal: getWidth(context) * 0.05),
                      child: ClipOval(
                        child: Image.asset(
                          images[1],
                          height: getHeight(context) * 0.60,
                        ),
                      ),
                    ),
                  ),
                ),
          isMobile
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Hello, I'm ",
                          textScaleFactor: 0.8,
                          style: GoogleFonts.pacifico(
                            fontSize: getHeight(context) * 0.06,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context)
                                .primaryTextTheme
                                .caption!
                                .color,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Jordy Hershel. 🚀 ",
                          textScaleFactor: 0.8,
                          style: GoogleFonts.pacifico(
                            fontSize: getHeight(context) * 0.06,
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.w900,
                          )),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
