import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/widgets/submit_button.dart';
import '../../view_model/chat_view_model.dart';
import '../../view_model/state/chat_state.dart';

class SubmitButtonSelector
    extends BlocSelector<ChatViewModel, ChatState, bool> {
  SubmitButtonSelector({super.key})
      : super(
            selector: (state) => state.isLoading,
            builder: (context, state) {
              return state
                  ? const CircularProgressIndicator()
                  : SubmitButton(
                      onPressed: context.read<ChatViewModel>().onButtonPressed,
                    );
            });
}
