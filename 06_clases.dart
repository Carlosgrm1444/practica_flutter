void main() {
  //  una variable a la cual se le da el tipo de una clase con el valor de esa clase
  final Hero wolverine = new Hero('Logan', 'Regeneracion');
  print('${wolverine.name} ${wolverine.power}');
  final Hero2 spiderman = new Hero2('Spiderman', 'Telaraña');
  print('${spiderman.name} ${spiderman.power}');
  final Hero3 ironman = new Hero3('IronMan', 'Tecnologia');
  print('${ironman.name} ${ironman.power}');
  final Hero4 antman = new Hero4(name: 'AntMan', power: 'Tamaño');
  print('${antman.name} ${antman.power}');
  print(antman);
}

//  se construye una clase
class Hero {
  String name;
  String power;
  //  constructor de la clase
  Hero(String pName, String pPower)
      //  de esta manera se le asigna un valor a la variable cuando se construye la clase
      : name = pName,
        power = pPower;
}

class Hero2 {
  String? name;
  String? power;
  Hero2(String pName, String pPower) {
    //  de esta manera se inicia una clase normal con variables posiblemente nulas
    name = pName;
    power = pPower;
  }
}

class Hero3 {
  String name;
  String power;
  //  de esta otra manera se hace la declaracion con la inicializacion del constructor
  Hero3(this.name, this.power);
}

class Hero4 {
  String name;
  String power;
  // de esta forma se declara con argumentos
  Hero4({required this.name, required this.power});
  //  para hacerlo opcional puedes sustituir el required por la variable asignando un valor default en caso de que sea
  @override
  String toString() {
    return '$name - $power';
  }
}
