import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/state/container/index.dart';
import '../../../../core/base/base_state.dart';
import '../../../../core/constants/enums/locales.dart';
import '../../view_model/settings_view_model.dart';
import '../settings_view.dart';

mixin SettingsViewMixin on BaseState<SettingsView> {
  late final SettingsViewModel _viewModel;

  SettingsViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SettingsViewModel();

    viewModel.context = context;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.changeLanguageText(
        Locales.values
            .firstWhere((element) => element.locale == context.locale)
            .text,
      );

      switch (AppStateItems.appCache.settings!.themeMode!) {
        case ThemeMode.light:
          _viewModel.changeThemeMode('light');
        case ThemeMode.dark:
          _viewModel.changeThemeMode('dark');
        case ThemeMode.system:
          _viewModel.changeThemeMode('system');
      }
    });
  }
}
