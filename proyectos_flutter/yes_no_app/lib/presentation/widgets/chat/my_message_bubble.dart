import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4, left: 50),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Text(
            "Voluptate sunt laboris esse velit anim ipsum.",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
