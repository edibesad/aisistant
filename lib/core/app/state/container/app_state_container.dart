import 'package:get_it/get_it.dart';

import '../../../init/navigation/app_navigation.dart';
import '../../../managers/cache/sp_cache_manager.dart';
import '../../../managers/cache/sqflite_cache_db_manager.dart';
import '../../../managers/network/dio_network_manager.dart';
import '../../../repository/cache_db_repository.dart';
import '../../../repository/cache_repository.dart';
import '../../../repository/network_repository.dart';
import '../../view_model/app_view_model.dart';

class AppStateContainer {
  const AppStateContainer._();
  static final GetIt _getIt = GetIt.I;

  static void setUp() {
    register();
  }

  static Future<void> register() async {
    _getIt.registerSingleton<AppRouter>(AppRouter());
    _getIt.registerSingleton<NetworkRepository>(DioManager());
    _getIt.registerSingleton<CacheRepository>(SPCacheManager());
    _getIt.registerSingleton<AppViewModel>(AppViewModel());
    _getIt.registerSingleton<CacheDBRepository>(SQFLiteCacheDBManager());
  }

  static T read<T extends Object>() => _getIt<T>();
}
