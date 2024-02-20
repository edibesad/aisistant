import 'package:flutter/material.dart';

import 'cutom_loading_indicator.dart';
import 'message_container.dart';

class MessageWaitingContainer extends StatelessWidget {
  const MessageWaitingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: MessageContainer(child: CustomLoadingIndicator()),
    );
  }
}
