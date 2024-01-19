import 'package:aisistant/core/app/state/container/index.dart';
import 'package:aisistant/core/app/view_model/app_view_model.dart';
import 'package:aisistant/core/repository/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../init/navigation/app_navigation.dart';

class BaseCubit<T extends Object> extends Cubit<T> {
  BaseCubit(super.initialState);

  GetIt get getIt => GetIt.instance;
  NetworkRepository get networkRepository => AppStateItems.networkRepository;
  AppRouter get appRouter => AppStateItems.appRouter;
  AppViewModel get appViewModel => AppStateItems.appViewModel;
  late BuildContext _context;

  BuildContext get context => _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
