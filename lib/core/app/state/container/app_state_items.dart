import '../../../init/navigation/app_navigation.dart';
import '../../../services/ai_service.dart';
import '../../../services/analytic_service.dart';
import '../../../services/cache_db_service.dart';
import '../../../services/cache_service.dart';
import '../../../services/network_service.dart';
import '../../models/app_cache.dart';
import '../../view_model/app_view_model.dart';
import 'index.dart';

class AppStateItems {
  const AppStateItems._();

  static AppCache appCache = AppCache(settings: CacheSettings());

  static AppRouter get appRouter => AppStateContainer.read<AppRouter>();

  static AppViewModel get appViewModel =>
      AppStateContainer.read<AppViewModel>();

  static NetworkService get networkService =>
      AppStateContainer.read<NetworkService>();

  static CacheService get cacheService =>
      AppStateContainer.read<CacheService>();

  static CacheDBService get cacheDBService =>
      AppStateContainer.read<CacheDBService>();

  static AIService get aiService => AppStateContainer.read<AIService>();

  static AnalyticService get analyticService =>
      AppStateContainer.read<AnalyticService>();
}
