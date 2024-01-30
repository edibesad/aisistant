import 'package:auto_route/auto_route.dart';

import '../../../features/chat/chat_list_view/view/chat_list_view.dart';
import '../../../features/one_shot/view/one_shot_view.dart';
import '../../../features/settings/view/settings_view.dart';
import '../../../features/settings/view/widgets/language_selection_view.dart';

part 'app_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: OneShotRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: LanguageSelectionRoute.page),
        AutoRoute(page: ChatListRoute.page, initial: true)
      ];
}
