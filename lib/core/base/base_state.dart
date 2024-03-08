import 'package:flutter/material.dart';

import '../app/state/container/app_state_items.dart';
import '../app/view_model/app_view_model.dart';
import '../services/analytic_service.dart';
import '../services/cache_db_service.dart';
import '../services/cache_service.dart';
import '../services/network_service.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  NetworkService get networkService => AppStateItems.networkService;
  CacheService get cacheService => AppStateItems.cacheService;
  CacheDBService get cacheDBService => AppStateItems.cacheDBService;
  AppViewModel get appViewModel => AppStateItems.appViewModel;
  AnalyticService get analyticService => AppStateItems.analyticService;

  @override
  void initState() {
    super.initState();
  }
}
