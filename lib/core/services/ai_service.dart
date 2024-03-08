import '../app/models/gemini/gemini_request.dart';

abstract class AIService {
  Future<Content> getResponse(List<Content> messages);
}
