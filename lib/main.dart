import 'package:aisistant/core/constants/app_constants.dart';
import 'package:aisistant/core/init/navigation/app_navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/init/app_init.dart';

Future<void> main() async {
  await AppInit().init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp.router(
      title: AppConstants.APP_NAME,
      themeMode: ThemeMode.system,
      routerConfig: router.config(),
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
    );
  }
}
