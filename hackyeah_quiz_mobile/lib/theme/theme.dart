import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Spacing {
  final EdgeInsets screenPadding = const EdgeInsets.all(10);

  const Spacing();
}

class AppColors {
  final MaterialColor primary = const MaterialColor(0xffe02424, <int, Color>{
    50: Color(0xfffdf2f2),
    100: Color(0xfffde8e8),
    200: Color(0xfffbd5d5),
    300: Color(0xfff8b4b4),
    400: Color(0xfff98080),
    500: Color(0xfff05252),
    600: Color(0xffe02424),
    700: Color(0xffc81e1e),
    800: Color(0xff9b1c1c),
    900: Color(0xff771d1d),
  });

  final Color textPrimary = const Color(0xff161e2e);
  final Color textSecondary = const Color(0xff374151);

  final Color appBackground = Colors.white;
  AppColors();
}

class AppTheme {
  static double mainBorderRadiusValue = 10;

  static Spacing spacing = const Spacing();
  static AppColors colors = AppColors();
  static TextTheme typography = const TextTheme(
    headline1: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: Color(0xff161e2e),
      fontFamily: "Poppins",
    ),
    headline2: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
      color: Color(0xff161e2e),
      fontFamily: "Poppins",
    ),
    headline3: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Poppins",
    ),
    headline4: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Poppins",
    ),
    headline5: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Poppins",
    ),
    headline6: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xff161e2e),
      fontFamily: "Poppins",
    ),
    bodyText1: TextStyle(
      fontFamily: "Poppins",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xff374151),
    ),
    bodyText2: TextStyle(
      fontFamily: "Poppins",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0xff374151),
    ),
    button: TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Color(0xff374151),
    ),
  );

  const AppTheme();
}
