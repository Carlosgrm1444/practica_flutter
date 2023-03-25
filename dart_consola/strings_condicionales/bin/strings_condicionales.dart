void main(List<String> args) {
  String correo = 'ejemplodart14@gmail.com';
  String mensaje;
  
  print(correo.contains('@'));  //El metodo constains() te devuelve el valor true si el texto en el que se esta usando tiene el valor que le estas asignando
  print(correo.endsWith('.com')); //El metodo endsWith() devuelve el valor true si el texto termina en el valor que le proporcionaste

  mensaje = correo.contains('@') && correo.endsWith('.com') ? 'Es un correo electronico' : 'No es un correo electronico';

  print(mensaje);

  print('Longitud de mensaje: ${correo.length}'); //Este metodo lo que hace es devolver la cantidad de caracteres que tiene el texto
  print(correo.substring(4, 14));  //Este metodo lo que hace es devolver los caracteres entre el primer numero y el segudno del texto

}