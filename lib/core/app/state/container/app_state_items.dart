import '../../../init/navigation/app_navigation.dart';
import '../../../repository/cache_db_repository.dart';
import '../../../repository/cache_repository.dart';
import '../../../repository/network_repository.dart';
import '../../models/app_cache.dart';
import '../../view_model/app_view_model.dart';
import 'index.dart';

class AppStateItems {
  const AppStateItems._();

  static AppCache appCache = AppCache(settings: CacheSettings());

  static NetworkRepository get networkRepository =>
      AppStateContainer.read<NetworkRepository>();

  static CacheRepository get cacheRepository =>
      AppStateContainer.read<CacheRepository>();

  static CacheDBRepository get cacheDBRepository =>
      AppStateContainer.read<CacheDBRepository>();

  static AppRouter get appRouter => AppStateContainer.read<AppRouter>();

  static AppViewModel get appViewModel =>
      AppStateContainer.read<AppViewModel>();
}
