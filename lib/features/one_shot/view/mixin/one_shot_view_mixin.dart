import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/models/gemini/gemini_request.dart';
import '../../../../core/app/models/gemini/gemini_response.dart';
import '../../../../core/base/base_state.dart';
import '../../view_model/one_shot_view_model.dart';

import '../one_shot_view.dart';

mixin OneShotViewMixin on BaseState<OneShotView> {
  late final OneShotViewModel _viewModel;

  OneShotViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = OneShotViewModel();
    _viewModel.context = context;
    analyticService.logScreenView('one_shot_view');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.emit(viewModel.state.copyWith(messages: [
        Content(
          parts: <Part>[
            Part(text: 'ask_me_anything'.tr()),
          ],
          role: Role.MODEL,
        ),
      ]));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.promptController.dispose();
  }
}
