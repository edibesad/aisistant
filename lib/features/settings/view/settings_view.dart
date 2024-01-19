import 'package:aisistant/core/base/base_state.dart';
import 'package:aisistant/features/settings/view/mixin/settings_view_mixin.dart';
import 'package:aisistant/features/settings/view/widgets/common_section/common_section.dart';
import 'package:aisistant/features/settings/view_model/settings_view_model.dart';
import 'package:aisistant/features/settings/view_model/state/settings_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
        create: ((context) => viewModel),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('settings').tr(),
          ),
          body: BlocListener<SettingsViewModel, SettingsState>(
            listener: (context, state) {},
            child: const Column(
              children: [CommonSection()],
            ),
          ),
        ));
  }
}
