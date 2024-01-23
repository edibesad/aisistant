import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/settings_view_model.dart';
import '../../../../view_model/state/settings_state.dart';
import '../../settings_tile.dart';

class ThemeTile extends BlocSelector<SettingsViewModel, SettingsState, String> {
  ThemeTile({super.key})
      : super(
          selector: (SettingsState state) => state.themeMode,
          builder: (BuildContext context, String state) => SettingsTile(
            title: const Text('theme').tr(),
            trailing: DropdownButton<String>(
              value: state,
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  value: 'system',
                  child: const Text('system').tr(),
                ),
                DropdownMenuItem<String>(
                  value: 'light',
                  child: const Text('light').tr(),
                ),
                DropdownMenuItem<String>(
                  value: 'dark',
                  child: const Text('dark').tr(),
                ),
              ],
              onChanged: (String? value) {
                context.read<SettingsViewModel>().onThemeModeChanged(value!);
              },
            ),
          ),
        );
}
