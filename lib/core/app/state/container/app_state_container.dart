import 'package:get_it/get_it.dart';

import '../../../init/navigation/app_navigation.dart';
import '../../../managers/ai/gemini_api_manager.dart';
import '../../../managers/analytic/firebase_analytics_manager.dart';
import '../../../managers/cache/sp_cache_manager.dart';
import '../../../managers/cache/sqflite_cache_db_manager.dart';
import '../../../managers/network/dio_network_manager.dart';
import '../../../services/ai_service.dart';
import '../../../services/analytic_service.dart';
import '../../../services/cache_db_service.dart';
import '../../../services/cache_service.dart';
import '../../../services/network_service.dart';
import '../../view_model/app_view_model.dart';

class AppStateContainer {
  const AppStateContainer._();
  static final GetIt _getIt = GetIt.I;

  static void setUp() {
    register();
  }

  static Future<void> register() async {
    _getIt.registerSingleton<AppRouter>(AppRouter());
    _getIt.registerSingleton<NetworkService>(DioManager());
    _getIt.registerSingleton<CacheService>(SPCacheManager());
    _getIt.registerSingleton<AppViewModel>(AppViewModel());
    _getIt.registerSingleton<CacheDBService>(SQFLiteCacheDBManager());
    _getIt.registerSingleton<AIService>(GeminiApiManager());
    _getIt.registerSingleton<AnalyticService>(FirebaseAnalyticsManager());
  }

  static T read<T extends Object>() => _getIt<T>();
}
