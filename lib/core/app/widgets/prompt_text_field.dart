import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class PromptTextField extends StatelessWidget {
  const PromptTextField({super.key, this.controller, this.onSubmitted});
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: context.themeData.brightness == Brightness.dark
              ? Colors.white
              : context.themeData.primaryColor),
      controller: controller,
      decoration: InputDecoration(hintText: 'prompt'.tr()),
      onSubmitted: onSubmitted,
      textCapitalization: TextCapitalization.sentences,
    );
  }
}
