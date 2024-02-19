import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  // Declaraciones de los colores 
  static const maincolor = Color.fromARGB(248, 0, 193, 74);
  static const backColor = Color.fromARGB(169, 199, 199, 199);
  static const letterColor = Color.fromARGB(255, 0, 0, 0);


  // Declaraciones del tema 
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
        appBarTheme: const AppBarTheme(color: maincolor),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            color: letterColor,
            fontSize: 23.0,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: Colors.teal,
            decorationStyle: TextDecorationStyle.double,
            decorationThickness: 3.0,
            fontStyle: FontStyle.italic,
          ),
          // bodySmall: GoogleFonts.aBeeZee(),
        ),
  );
}