import 'package:flutter/material.dart';
import 'package:scan_life/widgets/modal_medicine.dart';

class MedicineCards extends StatelessWidget {
  final Map data;

  const MedicineCards({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<double> costos = [];

    data['donde'].forEach((key, value) {
      costos.add(value.toDouble());
    });

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image(
          image: NetworkImage(data['image']),
        ),
        title: Text('${data['number']}.- ${data['nombre']}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Código de barras: ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: data['barcode'],
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Desde ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        '\$${costos.reduce((min, costo) => min < costo ? min : costo)}',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const TextSpan(
                    text: ' hasta ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text:
                        '\$${costos.reduce((max, costo) => max > costo ? max : costo)}',
                    style: const TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ModalMedicine(data: data);
            },
          );
        },
      ),
    );
  }
}
