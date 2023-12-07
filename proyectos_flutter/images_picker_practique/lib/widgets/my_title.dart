import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String textTitle;

  const MyTitle({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        textTitle,
        style: TextStyle(
          color: colors.primary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
