import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/widgets/message_waiting_container.dart';
import '../../view_model/chat_view_model.dart';
import '../../view_model/state/chat_state.dart';

class MessageWaitinSelector
    extends BlocSelector<ChatViewModel, ChatState, bool> {
  MessageWaitinSelector({super.key})
      : super(
            selector: (state) => state.isMessageWaiting,
            builder: (context, state) {
              return state ? const MessageWaitingContainer() : const SizedBox();
            });
}
