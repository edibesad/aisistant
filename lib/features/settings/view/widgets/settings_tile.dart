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
    return Padding(
      padding: context.paddingLow,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 4,
              color: context.themeData.colorScheme.surfaceVariant,
            )),
        child: ListTile(
          titleTextStyle: TextStyle(
              color: context.themeData.colorScheme.surfaceVariant,
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).textScaler.scale(18)),
          title: title,
          onTap: onTap,
          trailing: trailing,
          subtitle: subtitle,
        ),
      ),
    );
  }
}
