import 'package:flutter/material.dart';
import 'package:jordyhers/view/portfolio/portfolio_content_desktop.dart';
import 'package:jordyhers/view/portfolio/portfolio_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';


class PortfolioView extends StatefulWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: PortfolioContentMobile(),
      desktop: PortfolioContentDesktop(),
    );
  }
}
