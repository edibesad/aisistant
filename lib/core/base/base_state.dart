import 'package:flutter/material.dart';

import '../app/state/container/app_state_items.dart';
import '../app/view_model/app_view_model.dart';
import '../repository/network_repository.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  NetworkRepository get networkRepository => AppStateItems.networkRepository;
  AppViewModel get appViewModel => AppStateItems.appViewModel;

  @override
  void initState() {
    super.initState();
  }
}
