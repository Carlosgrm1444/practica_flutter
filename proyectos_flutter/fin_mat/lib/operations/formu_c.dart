import 'package:fin_mat/formuls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String nom = "";
Widget formula = Container();

class CfMit extends StatefulWidget {
  const CfMit({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CfMitState createState() => _CfMitState();
}

class _CfMitState extends State<CfMit> {
  final List<TextEditingController> fController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  double? resultado;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: visibles[0],
            child: TextFormField(
              controller: fController[0],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Capital (C) || Valor Actual (Va)'),
            ),
          ),
          Visibility(
            visible: visibles[1],
            child: TextFormField(
              controller: fController[1],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Monto (M) || Valor nominal (Vn)'),
            ),
          ),
          Visibility(
            visible: visibles[2],
            child: TextFormField(
              controller: fController[2],
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Interes simple (I)'),
            ),
          ),
          Visibility(
            visible: visibles[3],
            child: TextFormField(
              controller: fController[3],
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Taza de interes (i)'),
            ),
          ),
          Visibility(
            visible: visibles[4],
            child: TextFormField(
              controller: fController[4],
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Periodo de tiempo (t)'),
            ),
          ),
          Visibility(
            visible: visibles[5],
            child: TextFormField(
              controller: fController[5],
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Taza de descuento (d)'),
            ),
          ),
          Visibility(
            visible: visibles[6],
            child: TextFormField(
              controller: fController[6],
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Descuento comercial (Dc)'),
            ),
          ),
          Visibility(
            visible: visibles[7],
            child: TextFormField(
              controller: fController[7],
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Descuento real (Dr)'),
            ),
          ),
          Visibility(
            visible: visibles[8],
            child: TextFormField(
              controller: fController[8],
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Descuento (D)'),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              calcularResultado();
            },
            child: const Text('Calcular'),
          ),
          resultado != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text(
                    'Resultado anterior: $resultado',
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void calcularResultado() {
    // Obtener los valores ingresados por el usuario
    double fC = double.tryParse(fController[0].text) ?? 0;
    double fM = double.tryParse(fController[1].text) ?? 0;
    double fI = double.tryParse(fController[2].text) ?? 0;
    double fi = double.tryParse(fController[3].text) ?? 0;
    double ft = double.tryParse(fController[4].text) ?? 0;
    double fd = double.tryParse(fController[5].text) ?? 0;
    double fDc = double.tryParse(fController[6].text) ?? 0;
    double fDr = double.tryParse(fController[7].text) ?? 0;
    double fD = double.tryParse(fController[8].text) ?? 0;

    // Calcular el resultado de la fórmula
    double r = switchFormuls(fC, fM, fI, fi, ft, fd, fDc, fDr, fD);
    // Mostrar el resultado en un AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text('El resultado de la fórmula es: $r'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _copyToClipboard(r
                    .toString()); // Llama a la función para copiar al portapapeles
              },
              child: const Text('Copiar'),
            ),
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
      },
    );

    setState(() {
      resultado = r;
    });
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Resultado copiado al portapapeles'),
    ));
  }
}
