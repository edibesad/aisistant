import 'package:aisistant/features/settings/view_model/state/settings_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/settings_view_model.dart';
import '../../settings_tile.dart';

class ThemeTile extends BlocSelector<SettingsViewModel, SettingsState, String> {
  ThemeTile({super.key})
      : super(
            selector: (state) => state.themeMode,
            builder: (context, state) => SettingsTile(
                  title: const Text('theme').tr(),
                  trailing: DropdownButton<String>(
                    value: state,
                    items: [
                      DropdownMenuItem(
                          value: "system", child: const Text("system").tr()),
                      DropdownMenuItem(
                          value: "light", child: const Text("light").tr()),
                      DropdownMenuItem(
                          value: "dark", child: const Text("dark").tr())
                    ],
                    onChanged: (value) {
                      context
                          .read<SettingsViewModel>()
                          .onThemeModeChanged(value!);
                    },
                  ),
                ));
}
