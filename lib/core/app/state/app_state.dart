import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AppState extends Equatable {
  const AppState({this.themeMode = ThemeMode.system});

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  AppState copyWith({
    ThemeMode? themeMode,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
