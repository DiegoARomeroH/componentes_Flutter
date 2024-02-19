import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/home_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(169, 0, 170, 167),
        appBarTheme: const AppBarTheme(color: Color.fromARGB(248, 255, 200, 0)),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color.fromARGB(21, 110, 110, 110),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),

        ),
      ),
    );
  }
}
