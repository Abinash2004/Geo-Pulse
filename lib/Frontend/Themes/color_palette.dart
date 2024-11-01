import 'package:flutter/material.dart';

ThemeData colorPalette = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 227, 227, 227),
    primary: Color.fromARGB(255, 85, 103, 156),
    secondary: Color.fromARGB(255, 30, 42, 94),
    tertiary: Color.fromARGB(255, 124, 147, 195),
    inversePrimary:  Color.fromARGB(255, 120, 120, 120),
  ),
);

class ThemeProvider with ChangeNotifier {
  final ThemeData _themeData = colorPalette;
  ThemeData get themeData => _themeData;
}