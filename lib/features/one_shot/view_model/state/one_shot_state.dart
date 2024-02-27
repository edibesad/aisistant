import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/app/models/gemini/gemini_request.dart';

@immutable
class OneShotState extends Equatable {
  const OneShotState({
    this.isLoading = false,
    this.messages = const [],
  });
  final bool isLoading;
  final List<Content> messages;

  @override
  List<Object?> get props => <Object?>[isLoading, messages];

  OneShotState copyWith({
    bool? isLoading,
    List<Content>? messages,
  }) {
    return OneShotState(
      isLoading: isLoading ?? this.isLoading,
      messages: messages ?? this.messages,
    );
  }
}
