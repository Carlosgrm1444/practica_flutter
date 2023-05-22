void main() {
  print(greetEveryone()); //  asi se imprime un valor retornado de una funcion
  print(alsogreetEveryone());
  //  asi se envian parametros a una funcion
  print('Suma: ${addTwoNumbers(10, 20)}');
  print('Suma: ${alsoAddTwoNumbers(10, 20)}');
  print(greatPerson(name: 'Fernando', message: 'Hi'));
}

greetEveryone() {
  return 'Hello everyone!'; //  asi se retornan parametros por medio de una funcion
}

alsogreetEveryone() => 'Hello everyone!'; //  asi es una funcion de flecha

int addTwoNumbers(int a, int b) {
  return a + b; //  asi ser retornan valores con operaciones
}

alsoAddTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOptional(int a, [int? b]) {
  b ??=
      0; //  de esta manera se asigna un valor (en este caso 0) a una variable si es que es vacia
  return a + b;
}

int addTwoNumbersOptional2(int a, [int b = 0]) {
  //  de igual manera aqui podemos darle un valor en un inicio para en caso de no obtener un valor en su mencion
  return a + b;
}

String greatPerson({required String name, String message = 'Hola'}) {
  return '$message, $name';
}
