import 'package:flutter/material.dart';

import '../app/state/container/app_state_items.dart';
import '../app/view_model/app_view_model.dart';
import '../repository/cache_db_repository.dart';
import '../repository/cache_repository.dart';
import '../repository/network_repository.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  NetworkRepository get networkRepository => AppStateItems.networkRepository;
  CacheRepository get cacheRepository => AppStateItems.cacheRepository;
  CacheDBRepository get cacheDBRepository => AppStateItems.cacheDBRepository;
  AppViewModel get appViewModel => AppStateItems.appViewModel;

  @override
  void initState() {
    super.initState();
  }
}
