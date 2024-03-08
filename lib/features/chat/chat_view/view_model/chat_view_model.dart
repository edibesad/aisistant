import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/app/models/chat.dart';
import '../../../../core/app/models/gemini/gemini_request.dart';
import '../../../../core/app/models/gemini/gemini_response.dart';
import '../../../../core/base/base_cubit.dart';
import 'state/chat_state.dart';

class ChatViewModel extends BaseCubit<ChatState> {
  ChatViewModel() : super(const ChatState());

  ScrollController scrollController = ScrollController();

  TextEditingController textEditingController = TextEditingController();

  Chat? chat;

  void _changeState(
      {List<Content>? messages, bool? isLoading, bool? isMessageWaiting}) {
    emit(state.copyWith(
        messages: messages,
        isLoading: isLoading,
        isMessageWaiting: isMessageWaiting));

    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> fetchMessages() async {
    if (chat != null) {
      _changeState(isLoading: true);

      final List<Content> messages =
          await cacheDbService.getMesagesByChatId(chat!.id);

      _changeState(messages: messages, isLoading: false);
    }
  }

  Future<void> onButtonPressed() async {
    analyticService.logEvent('chat_message_submitted');

    if (!await _checkConditions()) {
      return;
    }

    if (chat == null) {
      await createChat('untitled'.tr());
      analyticService.logEvent('create_chat');
    }
    appViewModel.lastPromptSubmitted = DateTime.now();

    final Content message = Content(
      role: Role.USER,
      parts: [Part(text: textEditingController.text)],
    );

    final List<Content> messages = List.from(state.messages);

    analyticService.logEvent('chat_message_sent');
    messages.add(message);

    _changeState(messages: messages);

    textEditingController.clear();
    try {
      _changeState(isMessageWaiting: true);

      scrollController.jumpTo(scrollController.position.maxScrollExtent);

      final Content responseMessage = await aiService.getResponse(messages);

      if (responseMessage.parts![0].text == 'null') {
        _changeState(
            isMessageWaiting: false,
            messages: List.from(messages..removeLast()));
        return;
      }
      _changeState(
          isMessageWaiting: false,
          messages: List.from(messages)..add(responseMessage));

      scrollController.jumpTo(scrollController.position.maxScrollExtent);

      cacheDbService.insertMessage(message, chat!.id);
      cacheDbService.insertMessage(responseMessage, chat!.id);
      analyticService.logEvent('chat_message_received');
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

  // Check if conditions are met to get prompt
  Future<bool> _checkConditions() async {
    if (textEditingController.text.isEmpty) {
      return false;
    }

    if (state.isLoading) {
      return false;
    }

    if (appViewModel.lastPromptSubmitted != null &&
        DateTime.now().difference(appViewModel.lastPromptSubmitted!).inSeconds <
            15) {
      Fluttertoast.showToast(msg: 'wait_15_seconds'.tr());
      return false;
    }

    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    final bool hasConnection = await InternetConnectionChecker().hasConnection;

    if (connectivityResult == ConnectivityResult.none && !hasConnection) {
      emit(state.copyWith(isLoading: false));
      Fluttertoast.showToast(msg: 'check_internet_connection'.tr());

      return false;
    }

    return true;
  }

  Future<void> createChat(String title) async {
    final int id = await cacheDbService.insertChat(title);
    chat = Chat(id: id, title: title);
  }

  void onSubmitted(String value) {
    if (value.isNotEmpty && !state.isMessageWaiting) {
      onButtonPressed();
    }
  }
}
