import 'dart:async';
import 'dart:developer';

import 'package:aisistant/core/app/state/app_state.dart';
import 'package:aisistant/core/app/state/container/index.dart';
import 'package:aisistant/core/repository/cache_repository.dart';
import 'package:aisistant/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../app/view_model/app_view_model.dart';

final class AppInit {
  static AppInit? _instance;

  AppInit._init();

  factory AppInit() => _instance ??= AppInit._init();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppStateContainer.setUp();
    await runZonedGuarded(_initAsyncs, (error, stack) {
      log(error.toString());
    });
    await runZonedGuarded(_readCache, (error, stack) {
      log(error.toString());
    });
  }

  Future<void> _initAsyncs() async {
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  Future<void> _readCache() async {
    Object? themeMode =
        await AppStateContainer.read<CacheRepository>().get("theme_mode");
    log(themeMode.toString());
    switch (themeMode) {
      case "light":
        AppStateItems.appCache.settings!.themeMode = ThemeMode.light;
        AppStateContainer.read<AppViewModel>().changeThemeMode(ThemeMode.light);
        break;
      case "dark":
        AppStateItems.appCache.settings!.themeMode = ThemeMode.dark;
        AppStateContainer.read<AppViewModel>().changeThemeMode(ThemeMode.dark);
        break;
      default:
        AppStateItems.appCache.settings!.themeMode = ThemeMode.system;
        AppStateContainer.read<AppViewModel>().changeThemeMode(ThemeMode.light);
        break;
    }
  }
}
