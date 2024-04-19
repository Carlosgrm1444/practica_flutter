import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qrscan/qrscan.dart';
import 'package:scan_life/services/firebase_service.dart';
import 'package:scan_life/widgets/medicine_cards.dart';
import 'package:scan_life/widgets/modal_medicine.dart';

class ListMedicines extends StatefulWidget {
  const ListMedicines({super.key});

  @override
  State<ListMedicines> createState() => _ListMedicinesState();
}

class _ListMedicinesState extends State<ListMedicines> {
  String qrValue = '';

  void scanQr() async {
    String? cameraScanResuilt = await scan();

    if (cameraScanResuilt != null) {
      Map<dynamic, dynamic>? medicineData =
          (await getMedicineById(cameraScanResuilt)) as Map?;

      if (medicineData != null) {
        showDialog(
          context: context,
          builder: (context) => ModalMedicine(data: medicineData),
        );
      } else {
        // Tratar el caso en el que no se encuentre ninguna medicina con el código de barras escaneado
      }
    } else {
      // Tratar el caso en el que no se haya escaneado ningún código de barras
    }
  }

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
                  return MedicineCards(
                    data: snapshot.data?[index],
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
        onPressed: () {
          scanQr();
        },
      ),
    );
  }
}
