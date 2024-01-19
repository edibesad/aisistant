import 'package:aisistant/core/app/models/app_cache.dart';
import 'package:aisistant/core/app/state/container/index.dart';
import 'package:aisistant/core/repository/network_repository.dart';

import '../../../init/navigation/app_navigation.dart';
import '../../../repository/cache_repository.dart';
import '../../view_model/app_view_model.dart';

class AppStateItems {
  const AppStateItems._();

  static AppCache appCache = AppCache(settings: CacheSettings());

  static NetworkRepository get networkRepository =>
      AppStateContainer.read<NetworkRepository>();

  static CacheRepository get cacheRepository =>
      AppStateContainer.read<CacheRepository>();

  static AppRouter get appRouter => AppStateContainer.read<AppRouter>();

  static AppViewModel get appViewModel =>
      AppStateContainer.read<AppViewModel>();
}
