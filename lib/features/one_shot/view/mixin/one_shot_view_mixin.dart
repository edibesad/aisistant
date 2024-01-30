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
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.promptController.dispose();
  }
}
