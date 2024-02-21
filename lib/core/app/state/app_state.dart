import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/locales.dart';

@immutable
class AppState extends Equatable {
  const AppState({this.themeMode = ThemeMode.system, this.locale = Locales.en});

  final ThemeMode themeMode;
  final Locales locale;

  @override
  List<Object?> get props => <Object?>[themeMode, locale];

  AppState copyWith({
    ThemeMode? themeMode,
    Locales? locale,
  }) {
    log((locale == this.locale).toString());
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
