import 'package:gpt/core/adapters/database/database_adapter.dart';
import 'package:gpt/core/models/database/sql_column.dart';

import '../../models/chat_history/chat_history.dart';
import '../../services/database/queries_service.dart';

class ChatHistoryRepository {
  late QueriesService _instance;

  ChatHistoryRepository(DatabaseAdapter database) {
    _instance = database.instance();
  }

  getChatHistory() async {
    final response = await _instance.select("*").execute();
    return response;
  }

  insertChatHistory(ChatHistory chatHistory) async {
    final response =
        await _instance.insert([SqlColumn("from", "Ezequiel")]).execute();
    return response;
  }

  updateChatHistory(String chatId) async {
    final response = await _instance
        .update([SqlColumn("from", "Ezequiel")])
        .where("id = $chatId")
        .execute();
    return response;
  }

  cleanChatHistory(String chatId) async {
    final response = await _instance.delete().where("id = $chatId").execute();
    return response;
  }
}


