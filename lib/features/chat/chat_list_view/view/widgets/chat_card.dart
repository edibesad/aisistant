import 'package:easy_localization/easy_localization.dart';
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
            title: Text(chat.title, style: _getTextStyle(context)),
            trailing: PopupMenuButton(
              iconColor: context.isDark
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onTertiary,
              itemBuilder: (context) => [
                buildPopupMenuItem(context, () {
                  context.read<ChatListViewModel>().renameChat(chat);
                }, 'rename', FontAwesomeIcons.pen),
                buildPopupMenuItem(context, () {
                  context.read<ChatListViewModel>().deleteChat(chat.id);
                }, 'delete', FontAwesomeIcons.trash),
              ],
            )),
      ),
    );
  }

  TextStyle _getTextStyle(BuildContext context,
      {bool isBold = true, double fontSize = 24}) {
    return TextStyle(
        color: context.isDark
            ? context.colorScheme.onPrimary
            : context.colorScheme.onTertiary,
        fontWeight: isBold ? FontWeight.bold : null,
        fontSize: MediaQuery.of(context).textScaler.scale(fontSize));
  }

  PopupMenuItem<String> buildPopupMenuItem(
      BuildContext context, VoidCallback onTap, String value, IconData icon) {
    return PopupMenuItem(
      onTap: onTap,
      value: value,
      child: Row(
        children: [
          Icon(
            icon,
            color: context.themeData.colorScheme.onTertiary,
          ),
          const SizedBox(width: 8),
          Text(value,
                  style: _getTextStyle(context, fontSize: 18, isBold: false))
              .tr(),
        ],
      ),
    );
  }
}
