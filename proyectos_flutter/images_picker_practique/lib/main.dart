import 'package:flutter/material.dart';
import 'package:images_picker_practique/config/app_theme.dart';
import 'package:images_picker_practique/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Image Picker",
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        home:  const HomeScreen());
  }
}
