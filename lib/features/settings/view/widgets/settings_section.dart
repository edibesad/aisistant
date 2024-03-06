import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.content,
  });
  final List<Widget> content;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height * 0.02,
            bottom: MediaQuery.of(context).size.height * 0.02,
            start: 24,
            end: 24,
          ),
          child: Text(
            style: TextStyle(color: context.colorScheme.onTertiary),
            title,
          ),
        ),
        Column(
          children: content,
        ),
      ],
    );
  }
}
