import 'package:easy_localization/easy_localization.dart';

import '../../app/models/gemini/gemini_request.dart';
import '../../app/models/gemini/gemini_response.dart';
import '../../app/models/response_model.dart';
import '../../app/state/container/index.dart';
import '../../constants/hidden_constants.dart';
import '../../services/ai_service.dart';
import '../../services/network_service.dart';

class GeminiApiManager extends AIService {
  factory GeminiApiManager() {
    _instance ??= GeminiApiManager._init();
    return _instance!;
  }

  GeminiApiManager._init() {
    _networkService = AppStateItems.networkService;
  }

  static GeminiApiManager? _instance;
  late NetworkService _networkService;

  @override
  Future<Content> getResponse(List<Content> messages) async {
    final GeminiRequest request = _configureAI(messages);

    final ResponseModel response = await _prepareResponse(request);

    return Content(
      role: Role.MODEL,
      parts: [Part(text: _handleResponse(response))],
    );
  }

  Future<ResponseModel> _prepareResponse(GeminiRequest request) =>
      _networkService.postRequest(
        params: <String, dynamic>{
          'key': HiddenConstants.API_KEY,
        },
        data: request.toJson(),
      );

  String _handleResponse(ResponseModel response) {
    String message = 'No data';

    if (response.result!) {
      if (response.data is Map<String, dynamic>) {
        final GeminiResponse geminiResponse =
            GeminiResponse.fromJson(response.data as Map<String, dynamic>);

        if (geminiResponse.candidates != null &&
            geminiResponse.candidates!.isNotEmpty) {
          if (geminiResponse.candidates![0].finishReason ==
              FinishReason.FINISH_REASON_MAX_TOKENS) {
            message = 'busy_message'.tr();
          } else if (geminiResponse.candidates![0].finishReason ==
              FinishReason.FINISH_REASON_SAFETY) {
            message = 'safety_message'.tr();
          } else if (geminiResponse.candidates![0].finishReason ==
              FinishReason.FINISH_REASON_UNSPECIFIED) {
            message = 'unspecified_message'.tr();
          } else if (geminiResponse.candidates![0].finishReason ==
              FinishReason.FINISH_REASON_RECITATION) {
            message = 'recitation_message'.tr();
          } else if (geminiResponse.candidates![0].finishReason ==
              FinishReason.FINISH_REASON_OTHER) {
            message = 'other_message'.tr();
          }
        }

        if (geminiResponse.candidates != null &&
            geminiResponse.candidates!.isNotEmpty &&
            geminiResponse.candidates![0].content != null &&
            geminiResponse.candidates![0].content!.parts != null &&
            geminiResponse.candidates![0].content!.parts!.isNotEmpty &&
            geminiResponse.candidates![0].content!.parts![0].text != null) {
          message = geminiResponse.candidates![0].content!.parts![0].text!;
        }
      }
    } else {
      message = response.message ?? 'Error';
    }
    return message;
  }

  GeminiRequest _configureAI(List<Content> messages) => GeminiRequest(
        safetySettings: <SafetySetting>[
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
              threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE),
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
              threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE),
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_HARASSMENT,
              threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE),
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
              threshold: HarmBlockThreshold.BLOCK_MEDIUM_AND_ABOVE),
        ],
        contents: [
          const Content(parts: [
            Part(text: HiddenConstants.CONFIGURATION_PROMPT),
          ], role: Role.USER),
          const Content(parts: [
            Part(text: 'Understood!'),
          ], role: Role.MODEL),
          ...messages
        ],
        generationConfig: GenerationConfig(
          candidateCount: 1,
        ),
      );
}
