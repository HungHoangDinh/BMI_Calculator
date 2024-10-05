import 'package:flutter/material.dart';
import 'screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF0A0D22),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purple,
        ),
        scaffoldBackgroundColor: const Color(0xFF0A0D22),
      ),
      home: InputPage(),
    );
  }
}

