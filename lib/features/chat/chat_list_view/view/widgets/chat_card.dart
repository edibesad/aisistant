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
    return Padding(
      padding: context.paddingLow,
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(25),
          border: context.isDark
              ? null
              : Border.all(color: context.colorScheme.onTertiary, width: 2),
        ),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          onTap: () {
            context.read<ChatListViewModel>().navigateToChat(chat);
          },
          title: Text(chat.title,
              style: TextStyle(
                  color: context.isDark
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onTertiary,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).textScaler.scale(24))),
          trailing: IconButton(
            onPressed: () {
              context.read<ChatListViewModel>().deleteChat(chat.id);
            },
            icon: Icon(
              FontAwesomeIcons.trash,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
