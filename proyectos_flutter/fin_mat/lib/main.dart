import 'package:fin_mat/forms_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FinMat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const FormsScreen());
  }
}
