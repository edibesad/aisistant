import 'package:aisistant/core/base/base_state.dart';
import 'package:aisistant/core/extension/context_extension.dart';
import 'package:aisistant/features/one_shot/view/widgets/message_container.dart';
import 'package:aisistant/features/one_shot/view/widgets/prompt_text_field.dart';
import 'package:aisistant/features/one_shot/view/widgets/bloc_selectors/submit_button_bloc_selector.dart';
import 'package:aisistant/features/one_shot/view_model/one_shot_view_model.dart';
import 'package:aisistant/features/one_shot/view_model/state/one_shot_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mixin/one_shot_view_mixin.dart';

@RoutePage()
class OneShotView extends StatefulWidget {
  const OneShotView({super.key});

  @override
  State<OneShotView> createState() => _OneShotViewState();
}

class _OneShotViewState extends BaseState<OneShotView> with OneShotViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => viewModel,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('one_shot').tr(),
            ),
            body: BlocListener<OneShotViewModel, OneShotState>(
                listener: (context, state) {},
                child: Padding(
                  padding: context.paddingLow,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: MessageContainer()),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: context.width * .8,
                                child: const PromptTextField(),
                              ),
                              SubmitButtonBlocSelector()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
