import 'package:gpt/core/services/services.dart';

///
/// GPT Repository store the methods,
///  that allow interact with the openAi API.
///
class GptRepository {
  final GptService service;

  /// Constructor of the repository.
  /// [service] the library used for interact with GPT
  GptRepository(this.service);

  /// Make a question to the AI and get the response.
  ///
  /// [question] The question of user.
  ///
  /// [maxTokens] How long can be the response.
  Future<String> makeQuestion(String question, int maxTokens) async =>
      await service.makeQuestion(question, maxTokens);

  /// Inserts a message into the conversation context.
  ///
  /// [role] Who sends the message.
  ///
  /// [context] Message content.
  void updateConversationContext(String role, String content) =>
      service.insertMessageToGPTContext(role, content);
}
