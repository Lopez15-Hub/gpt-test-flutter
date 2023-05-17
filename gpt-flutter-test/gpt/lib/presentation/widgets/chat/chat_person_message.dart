import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ChatPersonMessage extends StatelessWidget {
  final String message;

  const ChatPersonMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5,
          ),
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 5,
            top: 5,
          ),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(
            message,
            softWrap: true,
            textAlign: TextAlign.left,
            overflow: TextOverflow.clip,
          ),
        ),
      ),
    );
  }
}
