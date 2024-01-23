import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_state.dart';
import '../../../core/extension/context_extension.dart';
import '../view_model/one_shot_view_model.dart';
import '../view_model/state/one_shot_state.dart';
import 'mixin/one_shot_view_mixin.dart';
import 'widgets/bloc_selectors/submit_button_bloc_selector.dart';
import 'widgets/message_container.dart';
import 'widgets/prompt_text_field.dart';

@RoutePage()
class OneShotView extends StatefulWidget {
  const OneShotView({super.key});

  @override
  State<OneShotView> createState() => _OneShotViewState();
}

class _OneShotViewState extends BaseState<OneShotView> with OneShotViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OneShotViewModel>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('one_shot').tr(),
          actions: <Widget>[
            IconButton(
              onPressed: viewModel.onSettingsPressed,
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: BlocListener<OneShotViewModel, OneShotState>(
          listener: (BuildContext context, OneShotState state) {},
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(child: MessageContainer()),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          width: context.width * .8,
                          child: const PromptTextField(),
                        ),
                        SubmitButtonBlocSelector(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
