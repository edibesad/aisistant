import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/app/state/container/app_state_items.dart';
import '../../../../core/constants/enums/locales.dart';

@RoutePage()
class LanguageSelectionView extends StatelessWidget {
  const LanguageSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Locales.values.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(Locales.values[index].text),
          onTap: () {
            AppStateItems.appRouter.pop(Locales.values[index].locale);
          },
        ),
      ),
    );
  }
}
