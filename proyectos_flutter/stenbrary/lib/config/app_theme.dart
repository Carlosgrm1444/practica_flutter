import 'package:flutter/material.dart';

const Color colorBase = Colors.deepOrangeAccent;

class AppTheme {
  AppTheme();

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorBase,
      brightness: Brightness.light,
    );
  }
}
