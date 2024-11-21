import 'package:flutter/material.dart';

class ApplicationTheme {
  static Color primaryColor = const Color(0xFF39A552);
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xFF39A552),
      appBarTheme: AppBarTheme(
          color: primaryColor,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 95,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),),),),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          )));
}
