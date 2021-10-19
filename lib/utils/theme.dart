import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
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
    Colors.purpleAccent,
    Colors.blueAccent,
  ]);
}
