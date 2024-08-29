import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static final lightTheme = ThemeData(
    textTheme: GoogleFonts.loraTextTheme(ThemeData.light().textTheme),
    canvasColor: Colors.black,
    scaffoldBackgroundColor: Colors.white70,
    dividerColor: Colors.grey.shade400,
    primaryTextTheme: TextTheme(
      bodySmall: TextStyle(color: Colors.black),
    ),
    iconTheme: IconThemeData(color: Colors.black),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      surface: Color(0xFFE4E4E4),
    ),
  );
}
