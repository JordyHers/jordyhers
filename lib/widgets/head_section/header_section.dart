import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';
import 'package:jordyhers/utils/theme.dart';
import 'package:jordyhers/utils/constants.dart' as st;

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context) * 0.65,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: NetworkImage(st.macBook_address),
              alignment: Alignment.center,
              scale: 2,
              //image: AssetImage('assets/images/head_banner.png'),
              fit: BoxFit.scaleDown)),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            left: 0,
            right: 0,
            top: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Build Responsive',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    )),
                Text('websites',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w900,
                        foreground: Paint()..shader = Style.linearGradient)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
