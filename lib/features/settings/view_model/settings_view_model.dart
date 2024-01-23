import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app/state/container/app_state_container.dart';
import '../../../core/app/view_model/app_view_model.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/constants/enums/locales.dart';
import '../../../core/init/navigation/app_navigation.dart';
import '../../../core/repository/cache_repository.dart';
import 'state/settings_state.dart';

class SettingsViewModel extends BaseCubit<SettingsState> {
  SettingsViewModel() : super(const SettingsState());

  void changeLanguageText(String language) {
    emit(state.copyWith(language: language));
  }

  void changeThemeMode(String themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void onLanguagePressed() {
    appRouter.push(const LanguageSelectionRoute()).then((Object? value) {
      if (value != null) {
        context.setLocale(value as Locale);
        changeLanguageText(
          Locales.values
              .firstWhere((Locales element) => element.locale == value)
              .text,
        );
      }
      return value;
    });
  }

  Future<void> onThemeModeChanged(String themeMode) async {
    changeThemeMode(themeMode);
    switch (themeMode) {
      case 'light':
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.light);
        AppStateContainer.read<CacheRepository>().put('theme_mode', 'light');
      case 'dark':
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.dark);
        AppStateContainer.read<CacheRepository>().put('theme_mode', 'dark');
      default:
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.system);
        AppStateContainer.read<CacheRepository>().put('theme_mode', 'system');
        break;
    }
  }
}
