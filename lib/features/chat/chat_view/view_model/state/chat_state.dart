import 'package:equatable/equatable.dart';

import '../../../../../core/app/models/gemini/gemini_request.dart';

class ChatState extends Equatable {
  const ChatState(
      {this.messages = const [],
      this.isLoading = false,
      this.isMessageWaiting = false});

  @override
  List<Object?> get props => [messages, isLoading, isMessageWaiting];

  final List<Content> messages;
  final bool isLoading;
  final bool isMessageWaiting;

  ChatState copyWith(
          {List<Content>? messages, bool? isLoading, bool? isMessageWaiting}) =>
      ChatState(
          messages: messages ?? this.messages,
          isLoading: isLoading ?? this.isLoading,
          isMessageWaiting: isMessageWaiting ?? this.isMessageWaiting);
}
