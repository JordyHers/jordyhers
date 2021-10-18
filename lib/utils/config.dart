import 'package:flutter/cupertino.dart';

double getHeight(context) {
  final height = MediaQuery.of(context).size.height;
  return height;
}

double getWidth(context) {
  final width = MediaQuery.of(context).size.width;
  return width;
}
