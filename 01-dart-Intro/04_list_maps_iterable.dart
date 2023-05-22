void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10]; //  Este es un list

  print('List original $numbers'); //  Asi se puede imprimir  un list
  print(
      'List original ${numbers.length}'); // imprime la cantidad de datos en un list
  print(
      'List original ${numbers[0]}'); //  imprime un dato exacto segun su indice
  print('List original ${numbers.first}'); //  imprime el primer dato del list
  print('List original ${numbers.last}'); //  imprime el ultimo dato del list
  print('List original ${numbers.reversed}'); //  imprime el list en

  final reversedNumbers = numbers.reversed; //   asi se convierte en un iterable
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}'); //  asi se convierte a list
  //  El set no permite datos duplicados
  print('Set: ${reversedNumbers.toSet()}'); //  asi se convierte a set
  print(
      'List sin repetidos ${numbers.toSet().toList()}'); //  asi se consigue un list sin repeticiones

  final numbersGreaterThan5 = numbers.where((int num) {
    //  asi solo se almacenan en un iterable los numeros mayores a 5
    return num > 5;
  });

  print('Iterable: $numbersGreaterThan5');
  print(
      'Sert: ${numbersGreaterThan5.toSet()}'); //  y asi se convierte en un set
}
