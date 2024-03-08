import '../app/models/chat.dart';
import '../app/models/gemini/gemini_request.dart';

abstract class CacheDBService {
  Future<List<Chat>> getChats();
  Future<List<Content>> getMesagesByChatId(int chatId);
  Future<bool> deleteChat(int chatId);
  Future<bool> insertMessage(Content content, int chatId);
  Future<int> insertChat(String? title);
  Future<int> renameChat(int id, String title);
}
