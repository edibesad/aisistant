import 'package:flutter/material.dart';

import '../../base/base_cubit.dart';
import '../state/app_state.dart';
import '../state/container/index.dart';

class AppViewModel extends BaseCubit<AppState> {
  AppViewModel()
      : super(
          AppState(
            themeMode:
                AppStateItems.appCache.settings?.themeMode ?? ThemeMode.system,
          ),
        );

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}
