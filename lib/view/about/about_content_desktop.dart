import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';

class AboutContentDesktop extends StatelessWidget {
  const AboutContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: getHeight(context),
        width: getWidth(context),
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
        child: Text(
          'About Page',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
    );
  }
}
