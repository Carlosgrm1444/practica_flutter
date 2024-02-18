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
            textFormul = "C=M/(1+it)"
          },
    ],
    '2': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'C = \frac{M}{1 + dt}',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'M, t, d',
      () => {
            visibles[1] = visibles[4] = visibles[5] = true,
            nom = 'C - Va',
            formula = Math.tex(
              r'C = \frac{M}{1 + dt}',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "C=M/(1+dt)"
          },
    ],
    '3': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'C = M - I',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'M, I',
      () => {
            visibles[1] = visibles[2] = true,
            nom = 'C - Va',
            formula = Math.tex(
              r'C = M - I',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "C = M - I"
          },
    ],
    '4': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'C = \frac{Dc(1-dt)}{dt}',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      't, d, Dc',
      () => {
            visibles[4] = visibles[5] = visibles[6] = true,
            nom = 'C - Va',
            formula = Math.tex(
              r'C = \frac{Dc(1-dt)}{dt}',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "C=Dc(1-dt)/dt"
          },
    ],
  },
  'M - Vn': {
    'name': 'Monto o Valor nominal',
    '1': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'M = C + I',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, I',
      () => {
            visibles[0] = visibles[2] = true,
            nom = 'M - Vn',
            formula = Math.tex(
              r'M = C + I',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "M=C+I"
          },
    ],
    '2': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'M = C (1 + it)',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, i, t',
      () => {
            visibles[0] = visibles[3] = visibles[4] = true,
            nom = 'M - Vn',
            formula = Math.tex(
              r'M = C (1 + it)',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "M=C(1+it)"
          },
    ],
    '3': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'M = C + Dc',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, Dc',
      () => {
            visibles[0] = visibles[6] = true,
            nom = 'M - Vn',
            formula = Math.tex(
              r'M = C + Dc',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "M=C+Dc"
          },
    ],
    '4': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'M = C + Dr',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, Dr',
      () => {
            visibles[0] = visibles[7] = true,
            nom = 'M - Vn',
            formula = Math.tex(
              r'M = C + Dr',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "M=C+Dr"
          },
    ],
  },
  'I': {
    'name': 'Interes simple',
    '1': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'I = Cit',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, i, t',
      () => {
            visibles[0] = visibles[3] = visibles[4] = true,
            nom = 'I',
            formula = Math.tex(
              r'I = Cit',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "I=Cit"
          },
    ],
    '2': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'I = M - C',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, M',
      () => {
            visibles[0] = visibles[3] = visibles[4] = true,
            nom = 'I',
            formula = Math.tex(
              r'I = M - C',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "I=M-C"
          },
    ],
  },
  'i': {'name': 'Taza de interes', '1': 'asdfas', '2': 'asdfas', '3': 'asdfas'},
  't': {
    'name': 'Periodo de tiempo',
    '1': [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Math.tex(
          r'I = Cit',
          textStyle: const TextStyle(fontSize: 19, color: Colors.green),
        ),
      ),
      'C, i, t',
      () => {
            visibles[0] = visibles[1] = true,
            nom = 'I',
            formula = Math.tex(
              r'I = Cit',
              textStyle: const TextStyle(fontSize: 29),
            ),
            textFormul = "I=Cit"
          },
    ],
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
  double r = 0;
  switch (nom) {
    case 'C - Va':
      switch (textFormul) {
        case "C=M/(1+it)":
          r = fM / (1 + fi * ft);
          break;
        case "C=M/(1+dt)":
          r = fM / (1 + fd * ft);
          break;
        case "C = M - I":
          r = fM - fI;
          break;
        case "C=Dc(1-dt)/dt":
          r = (fDc * (1 - (fd * ft))) / (fd * ft);
          break;
      }
      break;
    case 'M - Vn':
      switch (textFormul) {
        case "M=C+I":
          r = fC + fI;
          break;
        case "M=C(1+it)":
          r = fC * (1 + (fi * ft));
          break;
        case "M=C+Dc":
          r = fC + fDc;
          break;
        case "M=C+Dr":
          r = fC + fDr;
          break;
      }
      break;
    case 'I':
      switch (textFormul) {
        case "I=Cit":
          r = fC * fi * ft;
          break;
        case "I=M-C":
          r = fM - fC;
          break;
      }
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
  return r;
}
