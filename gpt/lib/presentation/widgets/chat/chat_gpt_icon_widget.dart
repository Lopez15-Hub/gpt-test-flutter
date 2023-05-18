import 'package:flutter/material.dart';

class GptIcon extends StatelessWidget {
  const GptIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundImage: AssetImage("assets/chat_gpt_icon.jpg"),
    );
  }
}
