import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../app/state/container/index.dart';
import '../app/view_model/app_view_model.dart';
import '../init/navigation/app_navigation.dart';
import '../repository/cache_db_repository.dart';
import '../repository/network_repository.dart';

class BaseCubit<T extends Object> extends Cubit<T> {
  BaseCubit(super.initialState);

  GetIt get getIt => GetIt.instance;
  NetworkRepository get networkRepository => AppStateItems.networkRepository;
  AppRouter get appRouter => AppStateItems.appRouter;
  AppViewModel get appViewModel => AppStateItems.appViewModel;
  CacheDBRepository get cacheDbRepository => AppStateItems.cacheDBRepository;

  late BuildContext context;

  @override
  void emit(T state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }
}
