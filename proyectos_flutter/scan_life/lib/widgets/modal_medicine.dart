import 'package:flutter/material.dart';

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
              title: Text('${data['number']}.- ${data['nombre']}'),
            ),
            ListTile(
              title: Text(data['barcode']),
            ),
            Image.network(data['image']),
            ListTile(
              title: Text('Que es?: ${data['es']}'),
            ),
            ListTile(
              title: const Text('Efectos Secundarios:'),
              subtitle: Column(
                children: (data['efectos'] as List<dynamic>)
                    .map((efecto) => Text('- $efecto'))
                    .toList(),
              ),
            ),
            ListTile(
              title: Text('Cómo tomarlo: ${data['como']}'),
            ),
            ListTile(
              title: const Text('Dónde conseguirlo:'),
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
