import 'package:flutter/material.dart';
import 'package:stenbrary/widgets/drawer_menu_widget.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({Key? key}) : super(key: key);

  @override
  _RegisterStudentState createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  String? selectedSex;
  String? selectedCareer;
  String? selectedSemester;
  String selectedCycle = "";

  TextEditingController matriculaController = TextEditingController();
  TextEditingController primerNombreController = TextEditingController();
  TextEditingController segundoNombreController = TextEditingController();
  TextEditingController apellidoPaternoController = TextEditingController();
  TextEditingController apellidoMaternoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();

  List<String> careers = [
    'Comercio exterior',
    'Administracion',
    'Contador publico',
    'Tecnologias de la informacion',
    'Derecho',
  ];

  List<String> semesters =
      List.generate(17, (index) => '${index + 1}° Semestre');

  @override
  void initState() {
    super.initState();
    // Agregar un listener para el campo de la matrícula
    matriculaController.addListener(_onMatriculaChanged);
  }

  void _onMatriculaChanged() {
    // Verificar si la matrícula tiene 10 dígitos
    if (matriculaController.text.length == 10) {
      // Extraer los dígitos 2, 3 y 4 de la matrícula para determinar el año y el periodo
      String year = matriculaController.text.substring(1, 3);
      String period = matriculaController.text.substring(3, 4);

      // Calcular el año escolar inicial
      int yearInt = int.parse(year);
      String cycle = '${2000 + yearInt} - $period';

      // Actualizar el valor del campo del ciclo escolar inicial
      setState(() {
        selectedCycle = cycle;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                controller: matriculaController,
                decoration: const InputDecoration(labelText: 'Matrícula'),
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
              TextFormField(
                controller: primerNombreController,
                decoration: const InputDecoration(labelText: 'Primer Nombre'),
              ),
              TextFormField(
                controller: segundoNombreController,
                decoration: const InputDecoration(labelText: 'Segundo Nombre'),
              ),
              TextFormField(
                controller: apellidoPaternoController,
                decoration:
                    const InputDecoration(labelText: 'Apellido Paterno'),
              ),
              TextFormField(
                controller: apellidoMaternoController,
                decoration:
                    const InputDecoration(labelText: 'Apellido Materno'),
              ),
              DropdownButtonFormField<String>(
                value: selectedCareer,
                decoration: const InputDecoration(labelText: 'Carrera'),
                items: careers.map((career) {
                  return DropdownMenuItem<String>(
                    value: career,
                    child: Text(career),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCareer = value;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: selectedSemester,
                decoration: const InputDecoration(labelText: 'Semestre Actual'),
                items: semesters.map((semester) {
                  return DropdownMenuItem<String>(
                    value: semester,
                    child: Text(semester),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSemester = value;
                  });
                },
              ),
              TextFormField(
                controller: telefonoController,
                decoration: const InputDecoration(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Ciclo Escolar Inicial',
                    // Mostrar el valor del ciclo escolar inicial si está definido
                    hintText: selectedCycle),
                controller: TextEditingController(text: selectedCycle),
              ),
              const SizedBox(height: 10),
              const Text('Sexo'),
              RadioListTile<String>(
                title: const Text('Hombre'),
                value: 'Hombre',
                groupValue: selectedSex,
                onChanged: (value) {
                  setState(() {
                    selectedSex = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Mujer'),
                value: 'Mujer',
                groupValue: selectedSex,
                onChanged: (value) {
                  setState(() {
                    selectedSex = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Prefiero no decirlo'),
                value: 'Prefiero no decirlo',
                groupValue: selectedSex,
                onChanged: (value) {
                  setState(() {
                    selectedSex = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_validateForm()) {
                    _showDialog();
                  }
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

  bool _validateForm() {
    if (matriculaController.text.length != 10) {
      _showError('La matrícula debe tener 10 dígitos');
      return false;
    }
    if (primerNombreController.text.isEmpty ||
        apellidoPaternoController.text.isEmpty) {
      _showError('El primer nombre y el apellido paterno son obligatorios');
      return false;
    }
    if (selectedCareer == null) {
      _showError('Debes seleccionar una carrera');
      return false;
    }
    if (selectedSemester == null) {
      _showError('Debes seleccionar un semestre');
      return false;
    }
    if (telefonoController.text.length != 10) {
      _showError('El teléfono es obligatorio');
      return false;
    }
    if (selectedSex == null) {
      _showError('Debes seleccionar un sexo');
      return false;
    }
    if (selectedCycle == null) {
      _showError('El ciclo escolar inicial no puede estar vacío');
      return false;
    }
    return true;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos del estudiante'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDialogContent('Matrícula', matriculaController.text),
                _buildDialogContent(
                    'Primer Nombre', primerNombreController.text),
                _buildDialogContent(
                    'Segundo Nombre', segundoNombreController.text),
                _buildDialogContent(
                    'Apellido Paterno', apellidoPaternoController.text),
                _buildDialogContent(
                    'Apellido Materno', apellidoMaternoController.text),
                _buildDialogContent('Carrera', selectedCareer ?? 'N/A'),
                _buildDialogContent(
                    'Semestre Actual', selectedSemester ?? 'N/A'),
                _buildDialogContent('Teléfono', telefonoController.text),
                _buildDialogContent(
                    'Ciclo Escolar Inicial', selectedCycle ?? 'N/A'),
                _buildDialogContent('Sexo', selectedSex ?? 'N/A'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogContent(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title + ':',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(value),
        const SizedBox(height: 16),
      ],
    );
  }
}
