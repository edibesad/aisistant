import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../abstracts/network_service.dart';
import '../init/navigation/app_navigation.dart';

class BaseCubit<T extends Object> extends Cubit<T> {
  BaseCubit(super.initialState);

  GetIt get getIt => GetIt.instance;
  NetworkService get networkService => getIt<NetworkService>();
  AppRouter get appRouter => getIt<AppRouter>();
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
