import 'package:flutter/material.dart';
import 'package:stenbrary/pages/register_student_page.dart';

class DrawerStateProvider extends ChangeNotifier {
  Widget _oldPage = const RegisterStudent();

  Widget get oldPage => _oldPage;

  void changePage(Widget newPage) {
    _oldPage = newPage;
    notifyListeners();
  }
}
