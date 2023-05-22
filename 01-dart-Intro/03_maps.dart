void main() {
  final Map<String, dynamic> pokemon = {
    //  Este es un map
    'name': 'Ditto',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': {1: 'ditto/front.png', 2: 'ditto/back.png'}
  };

  print(pokemon);
  //  De esta manera se imprimen valores especificos de un mapa
  print('Name: ${pokemon['name']}');
  print('Name: ${pokemon['sprites']}');

  //  TAREA

  print('Back: ${pokemon['sprites'][2]}');
  print('Front: ${pokemon['sprites'][1]}');
}
