import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatListWidgetItem extends StatefulWidget {
  late String username, lastMessage;
  ChatListWidgetItem(
      {super.key, required this.username, required this.lastMessage});

  @override
  State<ChatListWidgetItem> createState() => _ChatListWidgetItemState();
}

class _ChatListWidgetItemState extends State<ChatListWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/chat/123');
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 26.0,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(widget.username), Text(widget.lastMessage)],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(DateTime.now().toString().substring(0, 10)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
