import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 43, 11, 50);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.indigo,
  Colors.amber,
  Colors.lightBlue,
  Colors.orange,
  Colors.purple,
  Colors.red,
];
class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }): assert( selectedColor >= 0 && selectedColor < _colorThemes.length, 'Colors must be between 0 and ${_colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
      // useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }

  // ThemeData lightTheme = ThemeData.light().copyWith(
  //   primaryColor: Colors.indigo,
  //   appBarTheme: const AppBarTheme(
  //     color: Colors.indigo,
  //     elevation: 0
  //   )
  // );

  // ThemeData darkTheme = ThemeData.dark().copyWith(
  //   primaryColor: Colors.indigo,
  //   appBarTheme: const AppBarTheme(
  //     color: Colors.indigo,
  //     elevation: 0
  //   )
  // );
  
}