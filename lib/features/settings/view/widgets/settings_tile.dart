import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    this.title,
    this.onTap,
    this.trailing,
    this.subtitle,
  });
  final Widget? title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.themeData.colorScheme.primaryContainer,
      child: ListTile(
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.05),
        title: title,
        onTap: onTap,
        trailing: trailing,
        subtitle: subtitle,
      ),
    );
  }
}
