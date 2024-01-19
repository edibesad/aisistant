import 'package:aisistant/core/app/state/app_state.dart';
import 'package:aisistant/core/app/state/container/index.dart';
import 'package:aisistant/core/base/base_cubit.dart';
import 'package:flutter/material.dart';

class AppViewModel extends BaseCubit<AppState> {
  AppViewModel()
      : super(AppState(
            themeMode: AppStateItems.appCache.settings?.themeMode ??
                ThemeMode.system));

  changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
