import 'package:flutter/material.dart';

class CfMit extends StatefulWidget {
  const CfMit({Key? key}) : super(key: key);

  @override
  _CfMitState createState() => _CfMitState();
}

class _CfMitState extends State<CfMit> {
  final TextEditingController mController = TextEditingController();
  final TextEditingController iController = TextEditingController();
  final TextEditingController tController = TextEditingController();

  double? resultado;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: mController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Valor de M'),
        ),
        TextFormField(
          controller: iController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Valor de i'),
        ),
        TextFormField(
          controller: tController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: 'Valor de t'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            calcularResultado();
          },
          child: Text('Calcular'),
        ),
        resultado != null
            ? Text(
                'Resultado: $resultado',
                style: TextStyle(fontSize: 18),
              )
            : SizedBox(),
      ],
    );
  }

  void calcularResultado() {
    // Obtener los valores ingresados por el usuario
    double m = double.tryParse(mController.text) ?? 0;
    double i = double.tryParse(iController.text) ?? 0;
    double t = double.tryParse(tController.text) ?? 0;

    // Calcular el resultado de la fórmula
    double c = m * (1 + i * t);

    // Mostrar el resultado en un AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text('El resultado de la fórmula es: $c'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );

    setState(() {
      resultado = c;
    });
  }
}
