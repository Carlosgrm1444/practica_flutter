import 'package:flutter/material.dart';
import 'package:stenbrary/widgets/drawer_menu_widget.dart';

class RegisterStudent extends StatelessWidget {
  const RegisterStudent({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedSex = "";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de estudiantes'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Matrícula'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Carrera'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Semestre'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Teléfono'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ciclo Escolar'),
              ),
              const SizedBox(height: 10),
              const Text('Sexo'),
              RadioListTile(
                title: const Text('Hombre'),
                value: 'Hombre',
                groupValue: selectedSex,
                onChanged: (value) {},
              ),
              RadioListTile(
                title: const Text('Mujer'),
                value: 'Mujer',
                groupValue: selectedSex,
                onChanged: (value) {},
              ),
              RadioListTile(
                title: const Text('Prefiero no decirlo'),
                value: 'Prefiero no decirlo',
                groupValue: selectedSex,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes manejar la acción de enviar el formulario
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
