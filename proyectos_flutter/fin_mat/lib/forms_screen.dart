import 'package:fin_mat/operations/formu_c.dart';
import 'package:flutter/material.dart';

import 'formuls.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormsScreenState createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final List<bool> _customTileExpanded = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulas matematicas financieras"),
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
              SizedBox(
                height: 500,
                child: ListView.builder(
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
                                title: formuls[formuls.keys.elementAt(index)][0],
                                subtitle: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        fontSize: 17,
                                        color: Colors
                                            .black), // Estilo predeterminado del texto
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: 'Con los datos: ',
                                      ),
                                      TextSpan(
                                        text:
                                            '${formuls[formuls.keys.elementAt(index)][1]}',
                                        style: const TextStyle(
                                            color: Colors
                                                .redAccent), // Cambiar el color del texto según tus necesidades
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  formuls[formuls.keys.elementAt(index)][2]();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          const DialogCalcu());
                                },
                              ),
                            ));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DialogCalcu extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DialogCalcu({Key? key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          EdgeInsets.zero, // Elimina el relleno interno del contenido
      content: FractionallySizedBox(
        // Hace que el contenido abarque el máximo espacio posible
        widthFactor: 0.9, // Factor de ancho para el contenido
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 3.0), // Añade un relleno interno al contenido
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ajusta el tamaño del contenido según sea necesario
              children: [
                Center(child: formula),
                const SizedBox(
                    height:
                        20), // Añade un espacio entre el título y el contenido
                const CfMit(),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cerrar',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
