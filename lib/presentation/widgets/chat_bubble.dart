import 'package:flutter/material.dart';

Widget ChatBubble({
  required String message,
  String? username,
  required bool sender,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 6, bottom: 6),
    child: Row(
      mainAxisAlignment:
          sender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          width: 250,
          decoration: BoxDecoration(
              color: sender ? Colors.blue : Colors.lightGreen,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ],
    ),
  );
}
