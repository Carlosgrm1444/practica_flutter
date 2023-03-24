void main(List<String> args) {
  //Datos numericos
  int entero = 10;
  double decimal = 3.1416;

  //Cadenas de texto/caracteres
  String texto = 'este es un texto';

  //Datos Booleanos
  bool encendido = true;
  encendido = false;

  //Datos dinamicos
  var cualquier_dato1 = 3;  
  //var cualquier_dato1 = "texto"; 
  //Es una variable dinamica, pero al darle un valor en la declaracion se le asigna un tipo de dato estatico 

  //Si le intentamos cambiar un valor de esta manera dara error, pues en la declaracion se le asigno el tipo de dato int
  var cualquier_dato2;
  cualquier_dato2 = 3;
  cualquier_dato2 = 2.17;
  cualquier_dato2 = 'texto';
  cualquier_dato2 = true;
  //Pero si no asignamos ningun valor en la declaracion mantendra su tipo de dato dinamico

  //Pero para declarar desde el inicio una variable dinamica asignando valor podemos usar el dato dynamic
  dynamic variable_dinamica1 = 'texto';
  variable_dinamica1 = 3;
  variable_dinamica1 = 1.3;
  variable_dinamica1 = false;
  //Asi de esta manera le damos un dato desde la asignacion, pero puede seguir cambiando despues

  //Asignacion de valores con otras variables
  variable_dinamica1 = entero;
  variable_dinamica1 = decimal;
  variable_dinamica1 = encendido;
  variable_dinamica1 = cualquier_dato1;
  variable_dinamica1 = cualquier_dato2;
  //Asi le asignamos datos que estan dentro de una variable que ya hemos declarado anteriormente

  //Impresion en consola
  print('Esto es una variable numerica: $entero y esta es una variable dinamica: $variable_dinamica1');
  
}