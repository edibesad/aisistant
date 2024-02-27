import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/app/models/chat.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../view_model/chat_list_view_model.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: context.colorScheme.primary,
        child: ListTile(
          onTap: () {
            context.read<ChatListViewModel>().navigateToChat(chat);
          },
          title: Text(chat.title,
              style: TextStyle(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.08)),
          trailing: IconButton(
            onPressed: () {
              context.read<ChatListViewModel>().deleteChat(chat.id);
            },
            icon: Icon(
              FontAwesomeIcons.trash,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ));
  }
}
