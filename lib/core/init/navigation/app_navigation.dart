import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../features/chat/chat_list_view/view/chat_list_view.dart';
import '../../../features/chat/chat_view/view/chat_view.dart';
import '../../../features/home/view/home_view.dart';
import '../../../features/one_shot/view/one_shot_view.dart';
import '../../../features/settings/view/settings_view.dart';
import '../../../features/settings/view/widgets/language_selection_view.dart';
import '../../app/models/chat.dart';

part 'app_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: OneShotRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: LanguageSelectionRoute.page),
        AutoRoute(page: ChatListRoute.page),
        AutoRoute(page: ChatRoute.page)
      ];
}
