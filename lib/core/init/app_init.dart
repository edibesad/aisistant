import 'dart:async';
import 'dart:developer';

import 'package:aisistant/core/managers/network/dio_network_manager.dart';
import 'package:aisistant/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../abstracts/network_service.dart';
import 'navigation/app_navigation.dart';

final class AppInit {
  static AppInit? _instance;

  AppInit._init();

  factory AppInit() => _instance ??= AppInit._init();

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded(_initAsyncs, (error, stack) {
      log(error.toString());
    });
    _initServices();
  }

  Future<void> _initAsyncs() async {
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  _initServices() {
    GetIt.I.registerSingleton<AppRouter>(AppRouter());
    GetIt.I.registerSingleton<NetworkService>(DioManager());
  }
}
