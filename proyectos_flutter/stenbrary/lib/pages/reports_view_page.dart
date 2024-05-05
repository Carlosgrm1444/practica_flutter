import 'package:flutter/material.dart';
import 'package:stenbrary/widgets/drawer_menu_widget.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: const Center(
        child: Text('Reportes'),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
