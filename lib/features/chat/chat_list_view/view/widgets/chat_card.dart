import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/models/chat.dart';
import '../../view_model/chat_list_view_model.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        context.read<ChatListViewModel>().navigateToChat(chat);
      },
      title: Text(chat.title),
      trailing: IconButton(
        onPressed: () {
          context.read<ChatListViewModel>().deleteChat(chat.id);
        },
        icon: const Icon(Icons.delete),
      ),
    ));
  }
}
