import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/assets_constants.dart';
import '../../extension/context_extension.dart';
import '../models/gemini/gemini_request.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer(
      {super.key, required this.content, required this.role});

  final Widget content;
  final Role role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (role == Role.MODEL)
            const CircleAvatar(
              foregroundImage: AssetImage(AssetsConstants.ROBOT_ASSET),
            ),
          if (role == Role.MODEL)
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Expanded(
            child: Container(
              width: context.width,
              decoration: BoxDecoration(
                color: context.themeData.colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
              ),
              child: Padding(
                padding: context.paddingLow,
                child: content,
              ),
            ),
          ),
          if (role == Role.USER)
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          if (role == Role.USER)
            CircleAvatar(
              backgroundColor: context.secondaryColor,
              child: const Icon(FontAwesomeIcons.person),
            ),
        ],
      ),
    );
  }
}
