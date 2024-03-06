import 'package:flutter/material.dart';

import '../models/gemini/gemini_request.dart';
import 'cutom_loading_indicator.dart';
import 'message_container.dart';

class MessageWaitingContainer extends StatelessWidget {
  const MessageWaitingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
        child: const MessageContainer(
          role: Role.MODEL,
          content: CustomLoadingIndicator(),
        ));
  }
}
