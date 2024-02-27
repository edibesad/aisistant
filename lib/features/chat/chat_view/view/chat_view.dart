import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/models/chat.dart';
import '../../../../core/app/widgets/chat_bloc_provider.dart';

import '../../../../core/base/base_state.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/state/chat_state.dart';
import 'mixin/chat_view.mixin.dart';

@RoutePage()
class ChatView extends StatefulWidget {
  const ChatView({super.key, this.chat});

  final Chat? chat;
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends BaseState<ChatView> with ChatViewMixin {
  @override
  Widget build(BuildContext context) {
    return ChatBlocProvider<ChatViewModel, ChatState>(
        loadingSelectorCallback: (state) => state.isMessageWaiting,
        create: (context) => viewModel,
        selectorCallBack: (state) => state.messages,
        scrollController: viewModel.scrollController,
        onSubmitted: viewModel.onSubmitted,
        textEditingController: viewModel.textEditingController,
        onButtonPressed: viewModel.onButtonPressed);
  }
}
