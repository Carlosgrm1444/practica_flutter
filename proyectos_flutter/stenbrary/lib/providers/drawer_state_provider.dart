import 'package:flutter/material.dart';

class DrawerStateProvider extends ChangeNotifier {
  Widget? _oldPage;

  Widget? get oldPage => _oldPage;

  void changePage(Widget newPage) {
    _oldPage = newPage;
    notifyListeners();
  }
}