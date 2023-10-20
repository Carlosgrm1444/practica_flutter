import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://scontent.fnld1-1.fna.fbcdn.net/v/t39.30808-6/353818819_1153289988936154_2658223683182821431_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGBUFSIwO8IQVMXKt91-reyHkMdVNwY_a8eQx1U3Bj9r0H3kdQzMb4svMW8TEO3zkyuCB0I9NXYFNwo0_ULvUfS&_nc_ohc=A_QtqSgQVjwAX9n5Gn8&_nc_ht=scontent.fnld1-1.fna&oh=00_AfClwwFeZcxaNL5KZUsoiCRk31N-1GVg6sAfRHrn7Rr3WA&oe=6536A5C0"),
          ),
        ),
        title: const Text("Carlos Rodriguez"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                return Text("Indice $index");
              },
            )),
            Text('data')
          ],
        ),
      ),
    );
  }
}
