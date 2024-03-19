import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';
import '../models/chat.dart';
import '../state/container/index.dart';
import 'prompt_text_field.dart';

class ChatRenameDialog extends StatelessWidget {
  const ChatRenameDialog({super.key, required this.chat});

  final Chat chat;
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    return Dialog(
        child: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PromptTextField(
            controller: titleController,
            hintText: 'rename_chat',
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  AppStateItems.appRouter.pop(false);
                },
                child: Text(
                  'cancel',
                  style: TextStyle(color: context.colorScheme.errorContainer),
                ).tr(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty) {
                    return;
                  }
                  AppStateItems.cacheDBService
                      .renameChat(chat.id, titleController.text);
                  AppStateItems.appRouter.pop(true);
                },
                child: const Text('Rename').tr(),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
