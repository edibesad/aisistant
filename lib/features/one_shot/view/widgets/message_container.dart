import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';
import 'bloc_selectors/message_bloc_selector.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
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
