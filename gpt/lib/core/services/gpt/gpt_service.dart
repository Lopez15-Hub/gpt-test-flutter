import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

///
/// GPT Repository store the methods,
///  that allow interact with the openAi API.
///
class GptService {
  late OpenAI openAi;

  late CompleteText request;

  List<Map<String, String>> messages = []; //Conversation context.

  /// Service constructor.
  ///
  /// [apiToken] OpenAi Api Key.
  ///

  GptService(String apiToken) {
    openAi = OpenAI.instance.build(
        token: apiToken,
        isLog: true,
        baseOption: HttpSetup(receiveTimeout: const Duration(minutes: 1)));
  }

  /// Make a question to the AI and get the response.
  ///
  /// [question] The question of user.
  ///
  /// [maxTokens] How long can be the response.
  ///
  Future<String> makeQuestion(String question, int maxTokens) async {
    messages.add(Map.of({"role": "user", "content": question}));

    insertMessageToGPTContext("user", question);

    final request = ChatCompleteText(
        messages: messages, maxToken: maxTokens, model: ChatModel.gptTurbo);

    final ChatCTResponse? answer =
        await openAi.onChatCompletion(request: request);

    insertMessageToGPTContext(answer!.choices.last.message!.role,
        answer.choices.last.message!.content);

    return answer.choices.last.message!.content;
  }

  /// Insert a message to the conversation context.
  ///
  /// [role] Who sends the message.
  ///
  /// [context] Message content.
  ///
  void insertMessageToGPTContext(String role, String content) =>
      messages.add({"role": role, "content": content});
}
