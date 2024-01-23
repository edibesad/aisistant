import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_state.dart';
import '../view_model/settings_view_model.dart';
import '../view_model/state/settings_state.dart';
import 'mixin/settings_view_mixin.dart';
import 'widgets/common_section/common_section.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseState<SettingsView>
    with SettingsViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsViewModel>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('settings').tr(),
        ),
        body: BlocListener<SettingsViewModel, SettingsState>(
          listener: (BuildContext context, SettingsState state) {},
          child: const Column(
            children: <Widget>[CommonSection()],
          ),
        ),
      ),
    );
  }
}
