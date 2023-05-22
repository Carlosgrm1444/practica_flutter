void main() {
  final String pokemon = 'Dito'; //  cadena de texto
  final int hp = 100; //  integer
  final bool isAlive = true; //  booleana
  final List<String> abilities = ['impostor']; //  asi se declara una lista
  final sprites = <String>[
    'ditto/front.png',
    'ditto/back.png'
  ]; //  esta es otra lista

  // dynamic == null, es decir, las siempre podran ser nulas
//  las variables dinamicas pueden ser de cualquier tipo
  dynamic erroMessage = 'Hola'; //  como de texto
  erroMessage = true; //  booleana
  erroMessage = [1, 2, 3, 4, 5, 6]; //  listados
  erroMessage = {1, 2, 3, 4, 5, 6}; //  sets de datos
  erroMessage = () => true; //  funcion que regresa un valor booleano
  erroMessage = null; //  un valor null

  //  asi se imprime un string multilinea
  print(""" 
$pokemon
$hp
$isAlive
$abilities
$sprites
$erroMessage
""");
}
