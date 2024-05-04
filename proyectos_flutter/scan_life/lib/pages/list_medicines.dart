import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart';
import 'package:scan_life/pages/acerca_de.dart';
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
      appBar: AppBar(
        title: const Text("Medicamentos disponibles"),
      ),
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
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 500.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    scanQr();
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.scanner),
                      Text(
                        'Scanear',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformationPage()),
                    );
                  },
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.info),
                      Text(
                        'Acerca de',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InformationPage()),
              );
            },


            */