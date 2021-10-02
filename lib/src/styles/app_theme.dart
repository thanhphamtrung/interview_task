import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: 'Roboto',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 96.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: -1.5),
        headline2: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: -0.5),
        headline3: TextStyle(
            fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline4: TextStyle(
            fontSize: 36.0, fontWeight: FontWeight.w900, color: Colors.black),
        headline5: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0.18),
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0.15),
        subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.15),
        subtitle2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.1),
        bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            letterSpacing: 0.5),
        bodyText2: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            letterSpacing: 0.25),
        button: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w900,
            color: Colors.black,
            letterSpacing: 0.64),
        caption: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            letterSpacing: 0.33),
        overline: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            letterSpacing: 1.5),
      ),
    );
  }
}
