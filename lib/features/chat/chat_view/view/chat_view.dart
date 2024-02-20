import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/models/chat.dart';
import '../../../../core/app/widgets/prompt_text_field.dart';
import '../../../../core/app/widgets/submit_button.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/extension/context_extension.dart';
import '../view_model/chat_view_model.dart';
import '../view_model/state/chat_state.dart';
import 'mixin/chat_view.mixin.dart';
import 'widgets/messages_list_view_selector.dart';

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
    return BlocProvider<ChatViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('chat').tr(),
        ),
        body: BlocListener<ChatViewModel, ChatState>(
          listener: (context, state) {},
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: MessagesListView(),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.width * .8,
                        child: PromptTextField(
                          onSubmitted: viewModel.onSubmitted,
                          controller: viewModel.textEditingController,
                        ),
                      ),
                      SubmitButton(onPressed: viewModel.onButtonPressed)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
