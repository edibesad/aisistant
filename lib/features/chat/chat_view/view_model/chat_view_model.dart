import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/app/models/chat.dart';
import '../../../../core/app/models/gemini/gemini_request.dart';
import '../../../../core/app/models/gemini/gemini_response.dart';
import '../../../../core/app/models/response_model.dart';
import '../../../../core/base/base_cubit.dart';
import '../../../../core/constants/hidden_constants.dart';
import 'state/chat_state.dart';

class ChatViewModel extends BaseCubit<ChatState> {
  ChatViewModel() : super(const ChatState());

  ScrollController scrollController = ScrollController();

  TextEditingController textEditingController = TextEditingController();

  Chat? chat;

  DateTime? lastPromptSubmitted;

  final String _url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  void _changeState(
      {List<Content>? messages, bool? isLoading, bool? isMessageWaiting}) {
    emit(state.copyWith(
        messages: messages,
        isLoading: isLoading,
        isMessageWaiting: isMessageWaiting));
  }

  Future<void> fetchMessages() async {
    if (chat != null) {
      _changeState(isLoading: true);

      final List<Content> messages =
          await cacheDbRepository.getMesagesByChatId(chat!.id);

      _changeState(messages: messages, isLoading: false);
    }
  }

  Future<void> onButtonPressed() async {
    if (textEditingController.text.isNotEmpty) {
      if (!await _checkConditions()) {
        return;
      }

      if (chat == null) {
        await createChat('untitled'.tr());
        FirebaseAnalytics.instance.logEvent(name: 'create_chat');
      }

      final Content message = Content(
        role: Role.USER,
        parts: [Part(text: textEditingController.text)],
      );

      final List<Content> messages = List.from(state.messages);

      FirebaseAnalytics.instance.logEvent(name: 'chat_message_sent');

      messages.add(message);

      _changeState(messages: messages);

      textEditingController.clear();
      try {
        final GeminiRequest request = _prepareRequest();

        _changeState(isMessageWaiting: true);

        scrollController.jumpTo(scrollController.position.maxScrollExtent);

        final ResponseModel response = await _prepareResponse(request);
        final Content responseMessage = Content(
          role: Role.MODEL,
          parts: [Part(text: await _handleResponse(response))],
        );

        _changeState(
            isMessageWaiting: false,
            messages: List.from(messages)..add(responseMessage));

        scrollController.jumpTo(scrollController.position.maxScrollExtent);

        cacheDbRepository.insertMessage(message, chat!.id);
        cacheDbRepository.insertMessage(responseMessage, chat!.id);
      } catch (e) {
        _changeState(isMessageWaiting: false);
        messages.add(
          Content(
            role: Role.MODEL,
            parts: [Part(text: 'error'.tr())],
          ),
        );
      }

      _changeState(isMessageWaiting: false);
    }
  }

  // Check if conditions are met to get prompt
  Future<bool> _checkConditions() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    final bool hasConnection = await InternetConnectionChecker().hasConnection;

    log(hasConnection.toString());

    if (connectivityResult == ConnectivityResult.none && !hasConnection) {
      emit(state.copyWith(isLoading: false));
      Fluttertoast.showToast(msg: 'check_internet_connection'.tr());

      return false;
    }
    if (lastPromptSubmitted != null &&
        DateTime.now().difference(lastPromptSubmitted!).inSeconds < 30) {
      Fluttertoast.showToast(msg: 'wait_30_seconds'.tr());
      return false;
    }

    return true;
  }

  // Prepare request to send to API
  GeminiRequest _prepareRequest() => GeminiRequest(
        safetySettings: <SafetySetting>[
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT,
              threshold: HarmBlockThreshold.BLOCK_NONE),
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT,
              threshold: HarmBlockThreshold.BLOCK_NONE),
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_HARASSMENT,
              threshold: HarmBlockThreshold.BLOCK_NONE),
          SafetySetting(
              category: HarmCategory.HARM_CATEGORY_HATE_SPEECH,
              threshold: HarmBlockThreshold.BLOCK_NONE),
        ],
        contents: [
          Content(parts: [
            Part(text: HiddenConstants.CONFIGURATION_PROMPT),
          ], role: Role.USER),
          Content(parts: [
            Part(text: 'Understood!'),
          ], role: Role.MODEL),
          ...state.messages
        ],
        generationConfig: GenerationConfig(
          candidateCount: 1,
        ),
      );

  Future<void> createChat(String title) async {
    final int id = await cacheDbRepository.insertChat(title);
    chat = Chat(id: id, title: title);
  }

  void onSubmitted(String value) {
    if (value.isNotEmpty && !state.isMessageWaiting) {
      onButtonPressed();
    }
  }

  Future<ResponseModel> _prepareResponse(GeminiRequest request) =>
      networkRepository.postRequest(
        _url,
        params: <String, dynamic>{
          'key': HiddenConstants.API_KEY,
        },
        data: request.toJson(),
      );

  // Handle response which coming from API
  Future<String> _handleResponse(ResponseModel response) async {
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
}
