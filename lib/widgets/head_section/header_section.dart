import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class HeaderSection extends StatelessWidget {
  final bool isMobile;

  const HeaderSection({
    Key? key,
    required this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? getHeight(context) * 0.85 : getHeight(context) * 0.75,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          image: isMobile
              ? DecorationImage(
                  image: AssetImage('assets/images/swiftui_macbook.png'),
                  alignment: Alignment.center,
                  //image: AssetImage('assets/images/head_banner.png'),
                  fit: BoxFit.contain)
              : DecorationImage(
                  image: NetworkImage(st.flutter_address_image),
                  alignment: Alignment.center,
                  //image: AssetImage('assets/images/head_banner.png'),
                  fit: BoxFit.cover)),
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
              ],
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
