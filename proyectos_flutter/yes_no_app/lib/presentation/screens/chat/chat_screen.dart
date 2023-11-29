import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

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
    final chartProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chartProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chartProvider.messageList[index];
                return (message.fromWho == FromWho.hers)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),
            // ? Caja de texto
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
