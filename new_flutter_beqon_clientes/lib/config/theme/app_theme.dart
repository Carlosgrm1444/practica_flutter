import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: HexColor("862326"),
      // color: #862326 #ffffff #6c757d #343a40
    );
  }
}
