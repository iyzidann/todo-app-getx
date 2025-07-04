import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 1,
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.grey.shade800,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(Colors.black),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(Colors.white),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
