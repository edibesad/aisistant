import 'package:flutter/material.dart';

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
    return ListTile(
      title: title,
      onTap: onTap,
      trailing: trailing,
      subtitle: subtitle,
    );
  }
}
