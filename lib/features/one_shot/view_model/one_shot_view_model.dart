import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/app/models/gemini/gemini_request.dart';
import '../../../core/app/models/gemini/gemini_response.dart';
import '../../../core/app/models/response_model.dart';
import '../../../core/app/view_model/app_view_model.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/constants/hidden_constants.dart';
import 'state/one_shot_state.dart';

class OneShotViewModel extends BaseCubit<OneShotState> {
  OneShotViewModel() : super(const OneShotState());

  TextEditingController promptController = TextEditingController();

  ScrollController scrollController = ScrollController();

  DateTime? get lastPromptSubmitted =>
      context.read<AppViewModel>().lastPromptSubmitted;

  set lastPromptSubmitted(DateTime? value) =>
      context.read<AppViewModel>().lastPromptSubmitted = value;

  void onButtonPressed() {
    if (state.isLoading) {
      return;
    }
    // Close keyboard
    FocusManager.instance.primaryFocus?.unfocus();
    getPrompt();
  }

  // Get prompt from API and update state
  Future<void> getPrompt() async {
    final Content userMessage = Content(parts: [
      Part(text: promptController.text),
    ], role: Role.USER);

    if (!await _checkConditions(userMessage)) {
      return;
    }

    emit(state.copyWith(isLoading: true, messages: <Content>[userMessage]));

    lastPromptSubmitted = DateTime.now();

    promptController.clear();

    final GeminiRequest request = _prepareRequest();

    final ResponseModel response = await _prepareResponse(request);

    final List<Content> messages = [
      userMessage,
      Content(
        parts: <Part>[
          Part(text: _handleResponse(response)),
        ],
        role: Role.MODEL,
      ),
    ];

    emit(state.copyWith(isLoading: false, messages: messages));
  }

  // Check if conditions are met to get prompt
  Future<bool> _checkConditions(Content userMessage) async {
    if (promptController.text.isEmpty) {
      return false;
    }

    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      emit(state.copyWith(isLoading: false, messages: <Content>[
        userMessage,
        Content(
            parts: [Part(text: 'no_internet_connection'.tr())],
            role: Role.MODEL)
      ]));
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
        contents: <Content>[
          Content(
            parts: <Part>[
              const Part(text: HiddenConstants.CONFIGURATION_PROMPT),
              Part(
                text: promptController.text,
              ),
            ],
            role: Role.USER,
          ),
        ],
        generationConfig: GenerationConfig(
          candidateCount: 1,
        ),
      );

  // Send request to API
  Future<ResponseModel> _prepareResponse(GeminiRequest request) =>
      networkService.postRequest(
        params: <String, dynamic>{
          'key': HiddenConstants.API_KEY,
        },
        data: request.toJson(),
      );

  // Handle response which coming from API
  String _handleResponse(ResponseModel response) {
    String message = 'No data';

    if (response.result!) {
      if (response.data is Map<String, dynamic>) {
        final GeminiResponse geminiResponse =
            GeminiResponse.fromJson(response.data as Map<String, dynamic>);

        log(geminiResponse.toJson().toString());

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
