import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ScaffoldMessage(String? text, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text!),
    ),
  );
}
