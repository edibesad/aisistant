import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/settings_view_model.dart';
import '../../../../view_model/state/settings_state.dart';
import '../../settings_tile.dart';

class LanguageTile
    extends BlocSelector<SettingsViewModel, SettingsState, String> {
  LanguageTile({super.key})
      : super(
          selector: (SettingsState state) => state.language,
          builder: (BuildContext context, String state) => SettingsTile(
            subtitle: Text(state),
            title: const Text('language').tr(),
            trailing: const Icon(Icons.arrow_right),
            onTap: context.read<SettingsViewModel>().onLanguagePressed,
          ),
        );
}
