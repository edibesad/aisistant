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
            top: MediaQuery.of(context).textScaler.scale(24),
            bottom: MediaQuery.of(context).textScaler.scale(10),
            start: 24,
            end: 24,
          ),
          child: DefaultTextStyle(
            style: TextStyle(color: context.theme.primaryColor),
            child: Text(title),
          ),
        ),
        Column(
          children: content,
        ),
      ],
    );
  }
}
