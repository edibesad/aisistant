import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../app/state/container/index.dart';
import '../app/view_model/app_view_model.dart';
import '../init/navigation/app_navigation.dart';
import '../services/cache_db_service.dart';
import '../services/network_service.dart';

class BaseCubit<T extends Object> extends Cubit<T> {
  BaseCubit(super.initialState);

  GetIt get getIt => GetIt.instance;
  NetworkService get networkService => AppStateItems.networkService;
  AppRouter get appRouter => AppStateItems.appRouter;
  AppViewModel get appViewModel => AppStateItems.appViewModel;
  CacheDBService get cacheDbService => AppStateItems.cacheDBService;

  late BuildContext context;

  @override
  void emit(T state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }
}
