import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/one_shot_view_model.dart';

class PromptTextField extends StatelessWidget {
  const PromptTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<OneShotViewModel>().promptController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'prompt'.tr(),
      ),
      onSubmitted: context.read<OneShotViewModel>().onPromptSubmitted,
    );
  }
}
