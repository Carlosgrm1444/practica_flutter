import 'package:flutter/material.dart';
import 'package:stenbrary/widgets/drawer_menu_widget.dart';

class RegisterAttendance extends StatelessWidget {
  const RegisterAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de asistencia'),
      ),
      body: const Center(
        child: Text('Registro de asistencia'),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
