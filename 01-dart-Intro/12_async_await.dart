void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('http//:pagina');
    print(value);
  } catch (err) {
    print('Error: $err');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 2));
  throw 'Error en la peticion http';
  //return 'Tenemos un valor de la peticion';
}
