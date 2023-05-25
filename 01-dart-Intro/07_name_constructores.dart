void main() {
  //   de esta manera es un ejemplo de Json
  final Map<String, dynamic> rawJson = {
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': true
  };

  final ironman = Hero.fromJson(rawJson);

  //  de esta manera seria con un constructor normal
  // final ironman = Hero(
  //     name: rawJson['name'],
  //     power: rawJson['power'],
  //     isAlive: rawJson['isAlive'] ?? false);

  print(ironman);
}

//   se crea el constructor
class Hero {
  String name;
  String power;
  bool isAlive;
  //  se declara el constructor
  Hero({required this.name, required this.power, required this.isAlive});
  //  se asigna todos los datos directos a la clase
  Hero.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'No name found',
        power = json['power'] ?? 'No power found',
        isAlive = json['isAlive'] ?? 'Not isAlive';

  @override
  String toString() {
    //  en el return hay un if ternario, el cual es una pequeña condicion
    return '$name, $power, isAlive: ${isAlive ? 'YES!' : 'Nope'}';
  }
}
