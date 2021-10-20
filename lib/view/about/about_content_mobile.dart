import 'package:flutter/material.dart';
import 'package:jordyhers/utils/config.dart';

class AboutContentMobile extends StatelessWidget {
  const AboutContentMobile({Key? key}) : super(key: key);

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
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).primaryTextTheme.caption!.color),
        ),
      ),
    );
  }
}
