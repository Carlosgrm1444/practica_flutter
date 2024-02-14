import 'package:flutter/material.dart';

import 'formuls.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({Key? key}) : super(key: key);

  @override
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  List<bool> _customTileExpanded = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulas"),
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: formulario.keys.length, // La longitud de las claves del mapa
        itemBuilder: (BuildContext context, int index) {
          List<String> keys = formulario.keys.toList();
          String claveActual = keys[index];
          Map<String, dynamic> formuls = formulario[claveActual];
          _customTileExpanded.add(false);
          return ExpansionTile(
            title: Text(claveActual,
                style: const TextStyle(fontSize: 25, color: Colors.black54)),
            subtitle: Text(
              formuls['name'],
              style: const TextStyle(fontSize: 17, color: Colors.blueAccent),
            ),
            trailing: Icon(
              _customTileExpanded[index]
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customTileExpanded[index] = expanded;
              });
            },
            children: [
              ListView.builder(
                shrinkWrap: true, // Para que el ListView se ajuste al contenido
                itemCount: formuls.length,
                itemBuilder: (context, index) {
                  return formuls.keys.elementAt(index) == 'name'
                      ? Container()
                      : Card(
                          margin: const EdgeInsets.all(5.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                formuls[formuls.keys.elementAt(index)][0],
                                style: const TextStyle(fontSize: 20),
                              ),
                              subtitle: Text(
                                'Con los datos: ${formuls[formuls.keys.elementAt(index)][1]}',
                                style: const TextStyle(fontSize: 17),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        DialogCalcu(
                                          newPage: formuls[
                                              formuls.keys.elementAt(index)][2],
                                        ));
                              },
                            ),
                          ));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class DialogCalcu extends StatelessWidget {
  const DialogCalcu({super.key, required Widget newPage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Título del Diálogo'),
      content: newPage!,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cerrar'),
        ),
      ],
    );
  }
}
