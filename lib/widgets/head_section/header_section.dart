import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jordyhers/services/url_launcher.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  final bool isMobile;

  const HeaderSection({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<WebService>(context, listen: false);
    return Container(
      height: isMobile ? getHeight(context) * 0.85 : getHeight(context) * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        // image: isMobile
        //     ? DecorationImage(
        //         image: AssetImage('assets/images/swiftui_macbook.png'),
        //         alignment: Alignment.center,
        //         //image: AssetImage('assets/images/head_banner.png'),
        //         fit: BoxFit.contain)
        //     : DecorationImage(
        //         image: NetworkImage(st.flutter_address_image),
        //         alignment: Alignment.center,
        //         //image: AssetImage('assets/images/head_banner.png'),
        //         fit: BoxFit.cover)
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
                      : const EdgeInsets.symmetric(horizontal: 48.0),
                  child: Text("Hello, I'm ",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context)
                            .primaryTextTheme
                            .caption!
                            .color,
                      )),
                ),
                isMobile
                    ? Container()
                    : Padding(
                        padding: isMobile
                            ? const EdgeInsets.symmetric(horizontal: 8.0)
                            : const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Text("Jordy Hershel",
                            style: TextStyle(
                              fontSize: 55,
                              color: Colors.purpleAccent,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                SizedBox(height: 40),
                isMobile
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 38.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                'Find your developer expert for all your projects ',
                                style: TextStyle(
                                  fontSize: isMobile ? 25 : 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade700,
                                )),
                            Container(
                              width: getWidth(context) / 3,
                              child: Text(
                                  ' and design for both back-end and front-end.Handle simple and complex projects using the latest tools and '
                                  'the fastest growing platforms such as React Native and Flutter. '
                                  'Your expert can also provide counseling to your dev teams. You can find me on Upwork for Freelance projects.',
                                  style: TextStyle(
                                      fontSize: isMobile ? 23 : 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade700,
                                      height: 1.5)),
                            ),
                            SizedBox(height: 50),
                            ElevatedButton(
                              onPressed: () {
                                repository.downloadFile(st.cvPath);
                                print(
                                    '  CV Download Requested  and Successfully downloaded !......');
                              },
                              child: Text('Save Resume'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 30),
                                  textStyle: TextStyle(
                                      fontSize: 20,
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
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: 28.0),
                    child: Image.asset("assets/png/business.png",
                        height: getHeight(context) * 0.50),
                  ),
                )
              : Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Image.asset("assets/png/business.png"),
                  ),
                ),
          isMobile
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Hello, I'm ",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                        color: Theme.of(context)
                            .primaryTextTheme
                            .caption!
                            .color,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Jordy Hershel",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.w900,
                      )),
                ),
              ],
            ),
          )
              : Container()
        ],
      ),
    );
  }
}
