import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app/widgets/message_container.dart';
import '../../../core/app/widgets/prompt_text_field.dart';
import '../../../core/base/base_state.dart';
import '../../../core/extension/context_extension.dart';
import '../view_model/one_shot_view_model.dart';
import '../view_model/state/one_shot_state.dart';
import 'mixin/one_shot_view_mixin.dart';
import 'widgets/bloc_selectors/message_bloc_selector.dart';
import 'widgets/bloc_selectors/submit_button_bloc_selector.dart';

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
      create: (context) => viewModel,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: BlocListener<OneShotViewModel, OneShotState>(
          listener: (context, state) {},
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: MessageContainer(
                    child: MessageBlocSelector(),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _TextfielAndButtonRow(viewModel: viewModel),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('one_shot').tr(),
    );
  }
}

class _TextfielAndButtonRow extends StatelessWidget {
  const _TextfielAndButtonRow({
    required this.viewModel,
  });

  final OneShotViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          width: context.width * .8,
          child: PromptTextField(
            controller: viewModel.promptController,
            onSubmitted: viewModel.onPromptSubmitted,
          ),
        ),
        SubmitButtonBlocSelector(),
      ],
    );
  }
}
