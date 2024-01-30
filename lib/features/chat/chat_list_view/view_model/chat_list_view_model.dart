import 'dart:developer';

import '../../../../core/app/models/chat.dart';
import '../../../../core/base/base_cubit.dart';
import 'state/chat_list_state.dart';

class ChatListViewModel extends BaseCubit<ChatListState> {
  ChatListViewModel() : super(const ChatListState());

  void changeState({bool? isLoading, List<Chat>? chats}) {
    emit(state.copyWith(isLoading: isLoading, chats: chats));
  }

  Future<void> addButtonOnPressed(String title) async {
    final int id = await cacheDbRepository.insertChat('title');
    final List<Chat> chats = List.from(state.chats);
    log(state.chats.hashCode.toString());
    log(chats.hashCode.toString());
    chats.insert(0, Chat(id: id, title: title));
    changeState(chats: chats);
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
}
