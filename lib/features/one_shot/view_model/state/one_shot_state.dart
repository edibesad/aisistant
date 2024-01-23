import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class OneShotState extends Equatable {
  const OneShotState({
    this.isLoading = false,
    this.message = 'ask_me_anything',
  });
  final bool isLoading;
  final String message;

  @override
  List<Object?> get props => <Object?>[isLoading, message];

  OneShotState copyWith({
    bool? isLoading,
    String? message,
  }) {
    return OneShotState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}
