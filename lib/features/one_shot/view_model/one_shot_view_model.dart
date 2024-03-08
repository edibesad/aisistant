import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/app/models/gemini/gemini_request.dart';
import '../../../core/app/models/gemini/gemini_response.dart';
import '../../../core/app/view_model/app_view_model.dart';
import '../../../core/base/base_cubit.dart';
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
    analyticService.logEvent('one_shot_prompt_submitted');
    final Content userMessage = Content(parts: [
      Part(text: promptController.text),
    ], role: Role.USER);

    if (!await _checkConditions(userMessage)) {
      return;
    }

    emit(state.copyWith(isLoading: true, messages: <Content>[userMessage]));

    lastPromptSubmitted = DateTime.now();

    promptController.clear();

    final Content response = await aiService.getResponse([userMessage]);

    final List<Content> messages = [userMessage, response];

    emit(state.copyWith(isLoading: false, messages: messages));
  }

  // Check if conditions are met to get prompt
  Future<bool> _checkConditions(Content userMessage) async {
    if (promptController.text.isEmpty) {
      return false;
    }

    if (state.isLoading) {
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
}
