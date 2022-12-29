import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class AboutHeaderSection extends StatelessWidget {
  final bool isMobile;

  const AboutHeaderSection({Key? key, required this.isMobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: getHeight(context),
        width: getWidth(context),
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Container(
              width: getWidth(context),
              height: getHeight(context) * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(st.backgroundImage),
                      alignment: Alignment.center,
                      scale: 2,
                      //image: AssetImage('assets/images/head_banner.png'),
                      fit: BoxFit.cover)),
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('About',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            )),
                        Text('Us',
                            style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.w900,
                                color: Colors.purpleAccent)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        height: isMobile
                            ? getHeight(context) * 0.45
                            : getHeight(context) * 0.55,
                        child: Image.asset('assets/images/jordy_profile.jpg')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
