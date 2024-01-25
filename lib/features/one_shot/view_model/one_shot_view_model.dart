import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/app/models/gemini/gemini_request.dart';
import '../../../core/app/models/gemini/gemini_response.dart';
import '../../../core/app/models/response_model.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/constants/hidden_constants.dart';
import '../../../core/init/navigation/app_navigation.dart';
import 'state/one_shot_state.dart';

class OneShotViewModel extends BaseCubit<OneShotState> {
  OneShotViewModel() : super(const OneShotState());

  TextEditingController promptController = TextEditingController();

  DateTime? lastPromptSubmitted;

  ScrollController scrollController = ScrollController();

  final String _url =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent';

  Future<void> getPrompt() async {
    if (!await _checkConditions()) {
      return;
    }
    emit(state.copyWith(isLoading: true));

    lastPromptSubmitted = DateTime.now();

    final GeminiRequest request = _prepareRequest();

    log(request.toJson().toString());

    final ResponseModel response = await _prepareResponse(request);

    promptController.clear();
    final String message = await _handleResponse(response);

    emit(state.copyWith(isLoading: false, message: message));
  }

  Future<bool> _checkConditions() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      emit(state.copyWith(
          isLoading: false, message: 'check_internet_connection'.tr()));
      return false;
    }
    if (lastPromptSubmitted != null &&
        DateTime.now().difference(lastPromptSubmitted!).inSeconds < 30) {
      Fluttertoast.showToast(msg: 'wait_30_seconds'.tr());
      return false;
    }

    return true;
  }

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
              Part(
                  text:
                      'This is your configuration prompt. Your name is AIsistant. You are a virtual assistant. You must help the user with their general questions.'),
              Part(
                text: promptController.text,
              ),
            ],
            role: 'user',
          ),
        ],
        generationConfig: GenerationConfig(
          candidateCount: 1,
        ),
      );

  Future<ResponseModel> _prepareResponse(GeminiRequest request) =>
      networkRepository.postRequest(
        _url,
        params: <String, dynamic>{
          'key': HiddenConstants.API_KEY,
        },
        data: request.toJson(),
      );

  void onPromptSubmitted(String value) {
    if (state.isLoading) {
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    getPrompt();
  }

  Future<String> _handleResponse(ResponseModel response) async {
    String message = 'No data';

    if (response.result!) {
      if (response.data is Map<String, dynamic>) {
        final GeminiResponse geminiResponse =
            GeminiResponse.fromJson(response.data as Map<String, dynamic>);

        log(geminiResponse.toJson().toString());

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

  void onButtonPressed() {
    if (state.isLoading) {
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    getPrompt();
  }

  void onSettingsPressed() {
    appRouter.push(const SettingsRoute());
  }
}