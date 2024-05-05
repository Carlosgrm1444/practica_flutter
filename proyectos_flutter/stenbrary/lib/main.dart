import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stenbrary/config/app_theme.dart';
import 'package:stenbrary/pages/register_student_page.dart';
import 'package:stenbrary/providers/drawer_state_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DrawerStateProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          theme: AppTheme().theme(),
          home: const RegisterStudent(),
        ));
  }
}
