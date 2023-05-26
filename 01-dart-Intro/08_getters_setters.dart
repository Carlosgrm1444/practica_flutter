void main() {
  final mySquare = Square(side: 10);

  mySquare.side = -5;

  print('Area: ${mySquare.calcularArea()}');
}

class Square {
  double _side;

  Square({required double side})
      : assert(side >= 0, 'el lado debe de ser mayor a 0'),
        _side = side;

  double get area {
    return _side * _side;
  }

  set side(double value) {
    print('Sentting new value $value');
    if (value < 0) throw 'El valor tiene que se >=';

    _side = value;
  }

  double calcularArea() {
    return _side * _side;
  }
}
