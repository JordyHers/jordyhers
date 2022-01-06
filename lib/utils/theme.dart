import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    fontFamily: 'Montserrat',
    canvasColor: Colors.black,
    backgroundColor: Colors.white,
    dividerColor: Colors.grey.shade400,
    primaryTextTheme: TextTheme(caption: TextStyle(color: Colors.black)),
    iconTheme: IconThemeData(color: Colors.black),
  );
  static final darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    fontFamily: 'Montserrat',
    canvasColor: Colors.white,
    dividerColor: Colors.white,
    backgroundColor: Colors.black,
    primaryTextTheme: TextTheme(caption: TextStyle(color: Colors.white)),
    iconTheme: IconThemeData(color: Colors.white),
  );

  static final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Colors.purpleAccent,
      Colors.blueAccent,
    ],
  ).createShader(Rect.fromLTWH(200.0, 10.0, 200.0, 7.0));

  static final Shader subtitle = LinearGradient(
    colors: <Color>[
      Colors.purpleAccent,
      Colors.blueAccent,
    ],
  ).createShader(Rect.fromLTWH(400.0, 10.0, 300.0, 14.0));

  static final LinearGradient gradient = LinearGradient(colors: [
    Colors.blueAccent,
    Colors.purpleAccent,
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
