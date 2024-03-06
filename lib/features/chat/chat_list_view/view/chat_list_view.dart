import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/models/chat.dart';
import '../../../../core/base/base_state.dart';
import '../view_model/chat_list_view_model.dart';
import '../view_model/state/chat_list_state.dart';
import 'mixin/chat_list_view_mixin.dart';
import 'widgets/chat_card.dart';

@RoutePage()
class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends BaseState<ChatListView>
    with ChatListViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatListViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: BlocListener<ChatListViewModel, ChatListState>(
            listener: (context, state) {},
            child: BlocSelector<ChatListViewModel, ChatListState, bool>(
              selector: (state) => state.isLoading,
              builder: (context, isLoading) {
                return isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : BlocSelector<ChatListViewModel, ChatListState,
                        List<Chat>>(
                        selector: (state) => state.chats,
                        builder: (context, state) => ListView.builder(
                          itemCount: viewModel.state.chats.length,
                          itemBuilder: (context, index) {
                            return ChatCard(chat: viewModel.state.chats[index]);
                          },
                        ),
                      );
              },
            )),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
        title: const Text(
          'chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ).tr(),
        actions: [
          IconButton(
              onPressed: () => viewModel.addButtonOnPressed('title'),
              icon: const Icon(
                Icons.add,
              )),
        ],
      );
}
