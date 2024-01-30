import 'package:equatable/equatable.dart';

import '../../../../../core/app/models/chat.dart';

class ChatListState extends Equatable {
  const ChatListState({this.isLoading = false, this.chats = const []});

  final bool isLoading;
  final List<Chat> chats;

  @override
  List<Object?> get props => <Object?>[isLoading, chats];

  ChatListState copyWith({bool? isLoading, List<Chat>? chats}) => ChatListState(
      isLoading: isLoading ?? this.isLoading, chats: chats ?? this.chats);
}
