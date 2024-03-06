import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/extension/context_extension.dart';
import '../../../../view_model/settings_view_model.dart';
import '../../../../view_model/state/settings_state.dart';
import '../../settings_tile.dart';

class ThemeTile extends BlocSelector<SettingsViewModel, SettingsState, String> {
  ThemeTile({super.key})
      : super(
          selector: (state) => state.themeMode,
          builder: (context, state) => SettingsTile(
            title: const Text('theme').tr(),
            trailing: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              iconSize: 36,
              value: state,
              items: <DropdownMenuItem<String>>[
                buildDropdownMenuItem('system', context),
                buildDropdownMenuItem('light', context),
                buildDropdownMenuItem('dark', context),
              ],
              onChanged: (value) {
                context.read<SettingsViewModel>().onThemeModeChanged(value!);
              },
            ),
          ),
        );

  static DropdownMenuItem<String> buildDropdownMenuItem(
      String value, BuildContext context) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(
            color: context.themeData.brightness == Brightness.dark
                ? Colors.white
                : Colors.black),
      ).tr(),
    );
  }
}
