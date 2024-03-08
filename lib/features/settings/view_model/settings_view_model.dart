import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/app/state/container/index.dart';
import '../../../core/app/view_model/app_view_model.dart';
import '../../../core/base/base_cubit.dart';
import '../../../core/constants/enums/locales.dart';
import '../../../core/init/navigation/app_navigation.dart';
import '../../../core/services/cache_service.dart';
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
    appRouter.push(const LanguageSelectionRoute()).then((value) async {
      if (value != null) {
        await context.setLocale(value as Locale).then((_) {
          context.read<AppViewModel>().changeLocale(
                Locales.values.firstWhere((element) => element.locale == value),
              );
        });
        changeLanguageText(Locales.values
            .firstWhere((element) => element.locale == value)
            .text);

        Fluttertoast.showToast(
            msg: 'language_changed'.tr(), toastLength: Toast.LENGTH_LONG);
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
        AppStateItems.appCache.settings!.themeMode = ThemeMode.light;
        AppStateContainer.read<CacheService>().put('theme_mode', 'light');
      case 'dark':
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.dark);
        AppStateItems.appCache.settings!.themeMode = ThemeMode.dark;
        AppStateContainer.read<CacheService>().put('theme_mode', 'dark');
      default:
        log(themeMode);
        context.read<AppViewModel>().changeThemeMode(ThemeMode.system);
        AppStateItems.appCache.settings!.themeMode = ThemeMode.system;
        AppStateContainer.read<CacheService>().put('theme_mode', 'system');
        break;
    }
  }
}
