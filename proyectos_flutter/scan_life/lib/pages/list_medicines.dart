import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scan_life/services/firebase_service.dart';

class ListMedicines extends StatefulWidget {
  const ListMedicines({super.key});

  @override
  State<ListMedicines> createState() => _ListMedicinesState();
}

class _ListMedicinesState extends State<ListMedicines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medicamentos disponibles")),
      body: FutureBuilder(
          future: getMedicines(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image(
                        image: NetworkImage(snapshot.data?[index]['image']),
                      ),
                      title: Text(snapshot.data?[index]['nombre']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Código de barras: ${snapshot.data?[index]['barcode']}'),
                          Text(
                              'Costo mínimo: ${snapshot.data?[index]['numero ']}'),
                          Text(
                              'Costo máximo: ${snapshot.data?[index]['numero ']}'),
                          Text(
                              'Número de medicamento: ${snapshot.data?[index]['numero ']}'),
                        ],
                      ),
                      onTap: () {
                        // Acción a realizar cuando se toca la tarjeta del medicamento
                        // Por ejemplo, abrir una pantalla de detalles del medicamento
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.barcode),
        onPressed: () {},
      ),
    );
  }
}
