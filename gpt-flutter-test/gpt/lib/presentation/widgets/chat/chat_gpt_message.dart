import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ChatGptMessage extends StatelessWidget {
  final String message;

  final bool gptIsWriting;

  const ChatGptMessage(
      {super.key, required this.message, this.gptIsWriting = false});

  @override
  Widget build(BuildContext context) {
    return gptIsWriting
        ? ElasticIn(
            animate: true,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(message),
              ),
            ),
          )
        : FadeIn(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.asset("chat_gpt_icon.jpg"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: 5,
                      top: 5,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      message,
                      softWrap: true,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
