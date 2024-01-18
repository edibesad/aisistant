import 'package:aisistant/core/base/base_state.dart';
import 'package:aisistant/features/one_shot/view_model/one_shot_view_model.dart';

import '../one_shot_view.dart';

mixin OneShotViewMixin on BaseState<OneShotView> {
  late final OneShotViewModel _viewModel;

  OneShotViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = OneShotViewModel();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.promptController.dispose();
  }
}
