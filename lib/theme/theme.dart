import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notium/common/colors.dart';

final TextTheme baseTextTheme = GoogleFonts.poppinsTextTheme();

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    inverseSurface: Colors.grey.shade900,
    surface: Colors.grey.shade200,
    primary: primaryColor,
  ),
  textTheme: baseTextTheme,
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    inverseSurface: Colors.grey.shade200,
    surface: Colors.grey.shade900,
    primary: primaryColor,
  ),
  textTheme: baseTextTheme,
);
