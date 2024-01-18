// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_navigation.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    OneShotRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OneShotView(),
      );
    }
  };
}

/// generated route for
/// [OneShotView]
class OneShotRoute extends PageRouteInfo<void> {
  const OneShotRoute({List<PageRouteInfo>? children})
      : super(
          OneShotRoute.name,
          initialChildren: children,
        );

  static const String name = 'OneShotRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
