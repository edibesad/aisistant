import 'package:aisistant/core/base/base_cubit.dart';

import 'package:aisistant/features/one_shot/view_model/state/one_shot_state.dart';
import 'package:flutter/material.dart';

import '../../../core/app/models/gemini_response_model.dart';
import '../../../core/app/models/response_model.dart';
import '../../../core/constants/hidden_constants.dart';
import '../../../core/init/navigation/app_navigation.dart';

class OneShotViewModel extends BaseCubit<OneShotState> {
  OneShotViewModel() : super(const OneShotState());

  TextEditingController promptController = TextEditingController();

  DateTime? lastPromptSubmitted;

  ScrollController scrollController = ScrollController();

  void getPrompt() async {
    if (lastPromptSubmitted != null &&
        DateTime.now().difference(lastPromptSubmitted!).inSeconds < 30) {
      //TODO: show error
      return;
    }

    emit(state.copyWith(isLoading: true));
    lastPromptSubmitted = DateTime.now();
    final response = await networkRepository.postRequest(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent",
      params: {
        'key': HiddenConstants.API_KEY,
      },
      data: {
        'contents': [
          {
            'parts': [
              {
                'text': promptController.text,
              },
            ],
          },
        ],
      },
    );
    promptController.clear();
    String message = _handleResponse(response);

    emit(state.copyWith(isLoading: false, message: message));
  }

  void onPromptSubmitted(String value) {
    if (state.isLoading) {
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    // getPrompt();
  }

  String _handleResponse(ResponseModel response) {
    String message;
    if (response.result!) {
      if (response.data != null) {
        GeminiResponseModel geminiResponseModel =
            GeminiResponseModel.fromJson(response.data);
        message = geminiResponseModel.candidates![0].content!.parts![0].text!;
      } else {
        message = 'No data';
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
