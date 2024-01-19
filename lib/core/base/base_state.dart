import 'package:aisistant/core/app/state/container/app_state_items.dart';
import 'package:aisistant/core/app/view_model/app_view_model.dart';
import 'package:aisistant/core/repository/network_repository.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  NetworkRepository get networkRepository => AppStateItems.networkRepository;
  AppViewModel get appViewModel => AppStateItems.appViewModel;

  @override
  void initState() {
    super.initState();
  }
}
