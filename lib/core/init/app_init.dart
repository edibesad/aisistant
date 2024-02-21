import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';
import '../app/state/container/index.dart';
import '../app/view_model/app_view_model.dart';
import '../repository/cache_repository.dart';

final class AppInit {
  factory AppInit() => _instance ??= AppInit._init();

  AppInit._init();
  static AppInit? _instance;

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
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Firebase.app().setAutomaticDataCollectionEnabled(true);
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await FirebaseAnalytics.instance.logAppOpen();
  }

  Future<void> _readCache() async {
    final Object? themeMode =
        await AppStateContainer.read<CacheRepository>().get('theme_mode');
    log(themeMode.toString());
    switch (themeMode) {
      case 'light':
        AppStateItems.appCache.settings!.themeMode = ThemeMode.light;
        AppStateContainer.read<AppViewModel>().changeThemeMode(ThemeMode.light);
      case 'dark':
        AppStateItems.appCache.settings!.themeMode = ThemeMode.dark;
        AppStateContainer.read<AppViewModel>().changeThemeMode(ThemeMode.dark);
      default:
        AppStateItems.appCache.settings!.themeMode = ThemeMode.system;
        AppStateContainer.read<AppViewModel>().changeThemeMode(ThemeMode.light);
        break;
    }
  }
}
