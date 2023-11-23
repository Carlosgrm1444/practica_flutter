import 'package:flutter/material.dart';
import 'package:new_flutter_beqon_clientes/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          color: Colors.amber,
          child: Row(children: [
            FilledButton(
              onPressed: () {},
              child: const Text('Hello World'),
            ),
          ]),
        ),
      ),
    );
  }
}
