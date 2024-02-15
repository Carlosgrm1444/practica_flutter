import 'package:fin_mat/operations/formu_c.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

Map<String, dynamic> formulario = {
  'C - Va': {
    'name': 'Capital o Valor actual o presente',
    '1': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'C = \frac{M}{1 + it}',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'M, i, t',
      () => {
            visibles[1] = visibles[3] = visibles[4] = true,
            nom = 'C - Va',
            formula = Math.tex(
              r'C = \frac{M}{1 + it}',
              textStyle: const TextStyle(fontSize: 29),
            ),
          },
    ],
  },
  'M - Vn': {
    'name': 'Monto o Valor nominal',
    '1': 'asdfas',
    '2': 'asdfas',
    '3': 'asdfas'
  },
  'I': {'name': 'Interes simple', '1': 'asdfas', '2': 'asdfas', '3': 'asdfas'},
  'i': {'name': 'Taza de interes', '1': 'asdfas', '2': 'asdfas', '3': 'asdfas'},
  't': {
    'name': 'Periodo de tiempo',
    '1': 'asdfas',
    '2': 'asdfas',
    '3': 'asdfas'
  },
  'd': {
    'name': 'Taza de descuento',
    '1': 'asdfas',
    '2': 'asdfas',
    '3': 'asdfas'
  },
  'Dc': {
    'name': 'Descuento comercial',
    '1': 'asdfas',
    '2': 'asdfas',
    '3': 'asdfas'
  },
  'DR': {
    'name': 'Descuento real o justo',
    '1': 'asdfas',
    '2': 'asdfas',
    '3': 'asdfas'
  },
  'D': {'name': 'Descuento', '1': 'asdfas', '2': 'asdfas', '3': 'asdfas'},
};

List<bool> visibles = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

double switchFormuls(double fC, double fM, double fI, double fi, double ft,
    double fd, double fDc, double fDr, double fD) {
  switch (nom) {
    case 'C - Va':
      break;
    case 'M - Vn':
      break;
    case 'I':
      break;
    case 'i':
      break;
    case 't':
      break;
    case 'd':
      break;
    case 'Dc':
      break;
    case 'DR':
      break;
    case 'D':
      break;
    default:
  }
  return fM * (1 + fi * ft);
}
