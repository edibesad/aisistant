import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PromptTextField extends StatelessWidget {
  const PromptTextField({super.key, this.controller, this.onSubmitted});
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'prompt'.tr(),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
