import 'dart:developer';

import '../../../../core/app/models/chat.dart';
import '../../../../core/base/base_cubit.dart';
import '../../../../core/init/navigation/app_navigation.dart';
import 'state/chat_list_state.dart';

class ChatListViewModel extends BaseCubit<ChatListState> {
  ChatListViewModel() : super(const ChatListState());

  void changeState({bool? isLoading, List<Chat>? chats}) {
    emit(state.copyWith(isLoading: isLoading, chats: chats));
  }

  Future<void> addButtonOnPressed(String title) async {
    navigateToChat();
  }

  void fetchChats() {
    changeState(isLoading: true);

    cacheDbRepository.getChats().then((value) {
      changeState(isLoading: false, chats: value);
      log(value.toString());
    });
  }

  void deleteChat(int id) {
    cacheDbRepository.deleteChat(id);
    final List<Chat> chats = List.of(state.chats);
    chats.removeWhere((element) => element.id == id);
    changeState(chats: chats);
  }

  void navigateToChat([Chat? chat]) {
    appRouter.push(ChatRoute(chat: chat)).then((value) {
      fetchChats();
    });
  }
}
