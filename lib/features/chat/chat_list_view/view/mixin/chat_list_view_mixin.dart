import '../../../../../core/base/base_state.dart';
import '../../view_model/chat_list_view_model.dart';
import '../chat_list_view.dart';

mixin ChatListViewMixin on BaseState<ChatListView> {
  late final ChatListViewModel _viewModel;

  ChatListViewModel get viewModel => _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ChatListViewModel();
    _viewModel.context = context;
    _viewModel.fetchChats();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
