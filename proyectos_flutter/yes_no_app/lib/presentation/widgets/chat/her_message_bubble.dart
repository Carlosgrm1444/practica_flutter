import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 4, right: 50),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: const Text(
            "Hola mundo",
            style: TextStyle(color: Colors.white),
          ),
        ),
        _IageBubble()

        // Todo: imagen
      ],
    );
  }
}

class _IageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/no/20-56c4b19517aa69c8f7081939198341a4.gif",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: colors.tertiary,
            child: const Center(
                child: Text(
              "Carlos esta enviando una imgen",
              style: TextStyle(color: Colors.white),
            )),
          );
        },
      ),
    );
  }
}
