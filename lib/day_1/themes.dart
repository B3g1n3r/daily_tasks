import 'package:flutter/material.dart';
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: Colors.deepPurple,
    secondary: Colors.amberAccent,
    surface: Color(0xFF1E1E1E),
    background: Color(0xFF121212),
    onPrimary: Colors.red,
    onSecondary: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
    displayLarge: TextStyle(color: Colors.amberAccent, fontSize: 24, fontWeight: FontWeight.bold),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.deepPurpleAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    elevation: 4,
    foregroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Colors.amberAccent),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.orange,
    surface: Colors.white,
    background: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black87, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
    displayLarge: TextStyle(color: Colors.blueAccent, fontSize: 24, fontWeight: FontWeight.bold),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blue,
    elevation: 4,
    foregroundColor: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Colors.blueAccent),
);
