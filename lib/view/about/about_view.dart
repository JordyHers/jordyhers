import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_content_desktop.dart';
import 'about_content_mobile.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutContentMobile(),
      desktop: AboutContentDesktop(),
    );
  }
}
