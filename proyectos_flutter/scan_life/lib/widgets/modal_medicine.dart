import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ModalMedicine extends StatelessWidget {
  final Map data;

  const ModalMedicine({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Center(
                child: Text(
                  '${data['number']}.- ${data['nombre']}',
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  const Icon(FontAwesomeIcons.barcode),
                  Text(
                    '  ${data['barcode']}',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            Image.network(data['image']),
            ListTile(
              title: const Text(
                'Que es?',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data['es']),
            ),
            ListTile(
              title: const Text(
                'Efectos Secundarios:',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (data['efectos'] as List<dynamic>)
                      .map((efecto) => Text('- $efecto'))
                      .toList(),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Cómo tomarlo?',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data['como']),
            ),
            ListTile(
              title: const Text(
                'Dónde conseguirlo?',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                children: (data['donde'] as Map<String, dynamic>)
                    .entries
                    .map((entry) {
                  final nombreTienda = entry.key;
                  final precio =
                      entry.value; // Suponiendo que el valor es un double
                  return ListTile(
                    title: Text(nombreTienda),
                    subtitle: Text('Precio: \$${precio.toStringAsFixed(2)}'),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }
}
