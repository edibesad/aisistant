// ignore_for_file: always_specify_types

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/state/app_state.dart';
import 'core/app/state/container/app_state_items.dart';
import 'core/app/view_model/app_view_model.dart';
import 'core/constants/app_constants.dart';
import 'core/init/app_init.dart';
import 'core/init/app_localization.dart';
import 'core/init/theme/dark_app_theme.dart';
import 'core/init/theme/light_app_theme.dart';

Future<void> main() async {
  await AppInit().init();

  runApp(AppLocalization(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppViewModel(),
      child: BlocBuilder<AppViewModel, AppState>(
        builder: (context, state) {
          log('MainApp: ${state.locale.text}');
          return MaterialApp.router(
            title: AppConstants.APP_NAME,
            themeMode: state.themeMode,
            routerConfig: AppStateItems.appRouter.config(),
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            darkTheme: DarkAppTheme().themeData,
            theme: LightAppTheme().themeData,
          );
        },
      ),
    );
  }
}
