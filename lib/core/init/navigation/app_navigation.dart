import 'package:auto_route/auto_route.dart';

part 'app_navigation.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [];
}
