part of 'chat_cubit.dart';

abstract class ChatState {
  final List<ChatMessage> messages;

  ChatState(this.messages);
}

class ChatInitial extends ChatState {
  ChatInitial(List<ChatMessage> messages) : super(messages);

  ChatInitial copyWith({List<ChatMessage>? messages}) {
    return ChatInitial(messages ?? super.messages);
  }
}

class GptIsWriting extends ChatState {
  final bool isWriting;

  GptIsWriting(super.messages, {this.isWriting = true});

  GptIsWriting copyWith({List<ChatMessage>? messages, bool? isWriting}) {
    return GptIsWriting(
      messages ?? this.messages,
      isWriting: isWriting ?? this.isWriting,
    );
  }
}

class MessageSent extends ChatState {
  MessageSent(super.messages);
}
