import 'package:flutter/material.dart';

class AppTheme{
  static const maincolor = Color.fromARGB(248, 1, 202, 199);
  static const backColor = Color.fromARGB(169, 199, 199, 199);


  // Declaraciones del tema 
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
        appBarTheme: const AppBarTheme(color: maincolor),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}