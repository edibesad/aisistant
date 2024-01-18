import 'package:auto_route/auto_route.dart';

import '../../../features/one_shot/view/one_shot_view.dart';

part 'app_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes =>
      [AutoRoute(page: OneShotRoute.page, initial: true)];
}
