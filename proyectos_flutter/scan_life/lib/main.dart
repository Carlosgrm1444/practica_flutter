import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scan_life/config/app_theme.dart';
import 'package:scan_life/firebase_options.dart';
import 'package:scan_life/pages/list_medicines.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        home: const ListMedicines());
  }
}
