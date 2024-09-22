import 'package:flutter/material.dart';

class AppTheme {
  static const Color baseWhite = Color(0xFFFFFFFF);
  static const Color baseBlack = Color(0xFF000000);

  // Primary colors
  static const Color primary = Color(0xFF6194FA);
  static const Color primary100 = Color(0xFFDAE8FF);
  static const Color primary200 = Color(0xFFB2D0FF);
  static const Color primary300 = Color(0xFF89B8FF);
  static const Color primary400 = Color(0xFF619FFF);
  static const Color primary500 = Color(0xFF3987FF); // Main Primary color
  static const Color primary600 = Color(0xFF006AFF);
  static const Color primary700 = Color(0xFF005BDF);
  static const Color primary800 = Color(0xFF004CAF);
  static const Color primary900 = Color(0xFF003D7F);

  // Secondary colors
  static const Color secondary = Color(0xFF003049);
  static const Color secondary100 = Color(0xFFE6F6FF);
  static const Color secondary200 = Color(0xFFCCEDFF);
  static const Color secondary300 = Color(0xFFB3E4FF);
  static const Color secondary400 = Color(0xFF99DBFF);
  static const Color secondary500 = Color(0xFF80D2FF); // Main Secondary color
  static const Color secondary600 = Color(0xFF66C9FF);
  static const Color secondary700 = Color(0xFF4DC0FF);
  static const Color secondary800 = Color(0xFF33B7FF);
  static const Color secondary900 = Color(0xFF00A8E6);

  // Success, warning, and error colors
  static const Color success = Color(0xFF41D3BD);
  static const Color warning = Color(0xFFFFC071);
  static const Color error = Color(0xFFE14C4C);

  // Neutral colors
  static const Color neutral100 = Color(0xFFE6E6E6);
  static const Color neutral200 = Color(0xFFCCCCCC);
  static const Color neutral300 = Color(0xFFB3B3B3);
  static const Color neutral400 = Color(0xFF999999);
  static const Color neutral500 = Color(0xFF808080);
  static const Color neutral600 = Color(0xFF666666);
  static const Color neutral700 = Color(0xFF4D4D4D);
  static const Color neutral800 = Color(0xFF333333);
  static const Color neutral900 = Color(0xFF1A1A1A);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primary500,
      secondaryHeaderColor: secondary500,
      scaffoldBackgroundColor: neutral100,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: baseBlack),
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primary500,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        color: primary500,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primary700,
      secondaryHeaderColor: secondary700,
      scaffoldBackgroundColor: neutral900,
      textTheme: TextTheme(
        bodyText1: TextStyle(color: baseWhite),
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primary700,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: AppBarTheme(
        color: primary700,
      ),
    );
  }
}
