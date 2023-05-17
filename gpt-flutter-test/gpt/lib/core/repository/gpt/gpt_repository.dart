
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class GptRepository {
  late OpenAI openAi;
  late CompleteText request;
  List<Map<String, String>> messages = [];
  GptRepository(String apiToken) {
    openAi = OpenAI.instance.build(
        token: apiToken,
        isLog: true,
        baseOption: HttpSetup(receiveTimeout: const Duration(minutes: 1)));
  }

  Future<String> makeQuestion(String question, int maxTokens) async {
    messages.add(Map.of({"role": "user", "content": question}));
    insertMessageToGPTContext("user", question);

    final request = ChatCompleteText(
        messages: messages, maxToken: maxTokens, model: ChatModel.gptTurbo);

    final ChatCTResponse? answer =
        await openAi.onChatCompletion(request: request);

    insertMessageToGPTContext(answer!.choices.last.message!.role,
        answer.choices.last.message!.content);

    return answer.choices.last.message!.content ;
  }

  void insertMessageToGPTContext(String role, String content) =>
      messages.add({"role": role, "content": content});

  void cancelQuestion() => openAi.cancelAIGenerate();
}
