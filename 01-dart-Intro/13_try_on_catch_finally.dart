void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('http//:pagina');
    print('exito: $value');
  } on Exception catch (err) {
    print('Tenemos una excepcion: $err');
  } catch (err) {
    print('Tenemos un error: $err');
  } finally {
    print('Fin del try y catch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 2));
  throw Exception('No hay parametros en el URL');

  //return 'Tenemos un valor de la peticion';
}
