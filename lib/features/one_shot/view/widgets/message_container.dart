import 'package:aisistant/core/extension/context_extension.dart';
import 'package:aisistant/features/one_shot/view/widgets/bloc_selectors/message_bloc_selector.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: context.paddingLow,
          child: MessageBlocSelector(),
        ),
      ),
    );
  }
}
