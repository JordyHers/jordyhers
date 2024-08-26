import 'package:flutter/material.dart';

class ScreenConfig {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeightPercentage(BuildContext context, double percentage) {
    return getHeight(context) * (percentage / 100);
  }

  static double getWidthPercentage(BuildContext context, double percentage) {
    return getWidth(context) * (percentage / 100);
  }

  static EdgeInsets getHorizontalPadding(
      BuildContext context, double percentage) {
    double paddingValue = getWidthPercentage(context, percentage);
    return EdgeInsets.symmetric(horizontal: paddingValue);
  }

  static EdgeInsets getVerticalPadding(
      BuildContext context, double percentage) {
    double paddingValue = getHeightPercentage(context, percentage);
    return EdgeInsets.symmetric(vertical: paddingValue);
  }

  static EdgeInsets getPadding(BuildContext context,
      double horizontalPercentage, double verticalPercentage) {
    double horizontalPadding =
        getWidthPercentage(context, horizontalPercentage);
    double verticalPadding = getHeightPercentage(context, verticalPercentage);
    return EdgeInsets.symmetric(
        horizontal: horizontalPadding, vertical: verticalPadding);
  }
}

double getHeight(context) {
  final height = MediaQuery.of(context).size.height;
  return height;
}

double getWidth(context) {
  final width = MediaQuery.of(context).size.width;
  return width;
}
