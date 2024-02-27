import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  // Declaraciones de los colores 
  static const maincolor = Color.fromARGB(248, 0, 193, 74);
  static const backColor = Color.fromARGB(169, 199, 199, 199);
  static const letterColor = Color.fromARGB(255, 0, 0, 0);
  static const iconColor = Color.fromARGB(230, 0, 71, 78);
  static const whiteColor = Color.fromARGB(255, 255, 255, 255);


  // Declaraciones del tema 
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
        appBarTheme: AppBarTheme(
          color: maincolor,
          titleTextStyle:  GoogleFonts.aBeeZee(
            color: letterColor,
            fontSize: 28.5,
            fontWeight: FontWeight.bold,
          ),
          ),
        iconTheme: const IconThemeData(
            color: iconColor,
            size: 35.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              maincolor),
              
              foregroundColor: MaterialStateProperty.all(letterColor),

              textStyle: MaterialStateProperty.all(
                GoogleFonts.aBeeZee(color: letterColor, 
                fontSize: 22.0), 
              ),
           ),
        ),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            color: letterColor,
            fontSize: 23.0,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
            decorationColor: Colors.teal,
            decorationStyle: TextDecorationStyle.double,
            decorationThickness: 2.5,
            fontStyle: FontStyle.italic,
          ),

          headlineMedium: GoogleFonts.montserrat(
            color: letterColor,
            fontSize: 23.0,
            fontWeight: FontWeight.w500,
            decorationStyle: TextDecorationStyle.double,
            decorationThickness: 2.5,
          ),

          bodySmall: GoogleFonts.aBeeZee(
            color: letterColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: const Color.fromARGB(255, 0, 184, 181),
            decorationStyle: TextDecorationStyle.solid,
            decorationThickness: 2.0,
            fontStyle: FontStyle.italic,
          ),
        ),
  );
}