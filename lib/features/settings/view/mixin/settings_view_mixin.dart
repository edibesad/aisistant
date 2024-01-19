import 'package:aisistant/core/app/state/container/index.dart';
import 'package:aisistant/core/base/base_state.dart';
import 'package:aisistant/core/constants/enums/locales.dart';
import 'package:aisistant/features/settings/view/settings_view.dart';
import 'package:aisistant/features/settings/view_model/settings_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

mixin SettingsViewMixin on BaseState<SettingsView> {
  late final SettingsViewModel _viewModel;

  SettingsViewModel get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SettingsViewModel();
    viewModel.setContext(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _viewModel.changeLanguageText(Locales.values
          .firstWhere((element) => element.locale == context.locale)
          .text);
      switch (AppStateItems.appCache.settings!.themeMode!) {
        case ThemeMode.light:
          _viewModel.changeThemeMode("light");
          break;
        case ThemeMode.dark:
          _viewModel.changeThemeMode("dark");
          break;
        default:
          _viewModel.changeThemeMode("system");
          break;
      }
    });
  }
}
