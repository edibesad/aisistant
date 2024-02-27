import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/app/widgets/chat_bloc_provider.dart';

import '../../../core/base/base_state.dart';
import '../view_model/one_shot_view_model.dart';
import '../view_model/state/one_shot_state.dart';
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
    return Scaffold(
      body: ChatBlocProvider<OneShotViewModel, OneShotState>(
          loadingSelectorCallback: (state) => state.isLoading,
          create: (context) => viewModel,
          selectorCallBack: (state) => state.messages,
          scrollController: viewModel.scrollController,
          onSubmitted: (_) {
            viewModel.onButtonPressed();
          },
          textEditingController: viewModel.promptController,
          onButtonPressed: viewModel.onButtonPressed),
    );
  }
}
