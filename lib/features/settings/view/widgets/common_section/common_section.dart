import 'package:aisistant/features/settings/view/widgets/common_section/tiles/language_tile.dart';
import 'package:aisistant/features/settings/view/widgets/common_section/tiles/theme_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../settings_section.dart';

class CommonSection extends StatelessWidget {
  const CommonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: 'common'.tr(),
      content: [LanguageTile(), ThemeTile()],
    );
  }
}
