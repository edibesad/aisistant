import 'package:aisistant/core/managers/cache/sp_cache_manager.dart';
import 'package:aisistant/core/repository/cache_repository.dart';
import 'package:aisistant/core/repository/network_repository.dart';
import 'package:get_it/get_it.dart';

import '../../../init/navigation/app_navigation.dart';
import '../../../managers/network/dio_network_manager.dart';
import '../../view_model/app_view_model.dart';

class AppStateContainer {
  const AppStateContainer._();
  static final _getIt = GetIt.I;

  static void setUp() {
    register();
  }

  static register() async {
    GetIt.I.registerSingleton<AppRouter>(AppRouter());
    GetIt.I.registerSingleton<NetworkRepository>(DioManager());
    GetIt.I.registerSingleton<CacheRepository>(SPCacheManager());
    GetIt.I.registerSingleton<AppViewModel>(AppViewModel());
  }

  static T read<T extends Object>() => _getIt<T>();
}
