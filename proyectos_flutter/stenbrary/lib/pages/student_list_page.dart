import 'package:flutter/material.dart';
import 'package:stenbrary/widgets/drawer_menu_widget.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de estudiantes'),
      ),
      body: const Center(
        child: Text('Listado de estudiantes'),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
