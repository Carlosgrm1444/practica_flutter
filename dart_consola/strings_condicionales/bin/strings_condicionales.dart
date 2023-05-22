void main(List<String> args) {
  String correo = 'ejemplodart14@gmail.com';
  String mensaje;

  print(correo.contains(
      '@')); //El método contains() te devuelve el valor true si el texto en el que se esta usando tiene el valor que le estas asignando
  print(correo.endsWith(
      '.com')); //El método endsWith() devuelve el valor true si el texto termina en el valor que le proporcionaste

  mensaje = correo.contains('@') && correo.endsWith('.com')
      ? 'Es un correo electrónico'
      : 'No es un correo electrónico';

  print(mensaje);

  print(
      'Longitud de mensaje: ${correo.length}'); //Este método lo que hace es devolver la cantidad de caracteres que tiene el texto
  print(correo.substring(4,
      14)); //Este método lo que hace es devolver los caracteres entre el primer numero y el segundo del texto
}
