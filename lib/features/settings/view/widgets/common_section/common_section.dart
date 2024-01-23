import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../settings_section.dart';
import 'tiles/language_tile.dart';
import 'tiles/theme_tile.dart';

class CommonSection extends StatelessWidget {
  const CommonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'common'.tr(),
      content: <Widget>[LanguageTile(), ThemeTile()],
    );
  }
}
