import '../../../../core/base/base_state.dart';
import '../../view_model/home_view_model.dart';
import '../home_view.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;

  HomeViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    _viewModel.context = context;
  }
}
