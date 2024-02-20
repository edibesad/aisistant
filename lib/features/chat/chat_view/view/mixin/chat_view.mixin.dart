import '../../../../../core/base/base_state.dart';
import '../../view_model/chat_view_model.dart';
import '../chat_view.dart';

mixin ChatViewMixin on BaseState<ChatView> {
  late final ChatViewModel _viewModel;

  ChatViewModel get viewModel => _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ChatViewModel();
    _viewModel.context = context;
    _viewModel.chat = widget.chat;
    _viewModel.fetchMessages();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.scrollController.dispose();
  }
}
