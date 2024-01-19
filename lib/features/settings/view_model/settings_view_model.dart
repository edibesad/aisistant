import 'dart:developer';

import 'package:aisistant/core/app/view_model/app_view_model.dart';
import 'package:aisistant/core/base/base_cubit.dart';
import 'package:aisistant/core/constants/enums/locales.dart';
import 'package:aisistant/core/repository/cache_repository.dart';
import 'package:aisistant/features/settings/view_model/state/settings_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app/state/container/app_state_container.dart';
import '../../../core/init/navigation/app_navigation.dart';

class SettingsViewModel extends BaseCubit<SettingsState> {
  SettingsViewModel() : super(const SettingsState());

  void changeLanguageText(String language) {
    emit(state.copyWith(language: language));
  }

  void changeThemeMode(String themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void onLanguagePressed() {
    (appRouter.push(const LanguageSelectionRoute()).then((value) {
      if (value != null) {
        context.setLocale(value as Locale);
        changeLanguageText(Locales.values
            .firstWhere((element) => element.locale == value)
            .text);
      }
      return value;
    }));
  }

  Future<void> onThemeModeChanged(String themeMode) async {
    changeThemeMode(themeMode);
    switch (themeMode) {
      case 'light':
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.light);
        AppStateContainer.read<CacheRepository>().put("theme_mode", "light");
        break;
      case 'dark':
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.dark);
        AppStateContainer.read<CacheRepository>().put("theme_mode", "dark");
        break;
      default:
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.system);
        AppStateContainer.read<CacheRepository>().put("theme_mode", "system");
        break;
    }
  }
}
