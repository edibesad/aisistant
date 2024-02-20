import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_state.dart';
import 'mixin/home_view_mixin.dart';
import 'widgets/page_container.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  double divider = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeContainer(title: 'one_shot', onTap: viewModel.onOneShotTap),
            SizedBox(height: divider),
            HomeContainer(title: 'chat', onTap: viewModel.onChatTap),
            SizedBox(height: divider),
            HomeContainer(title: 'settings', onTap: viewModel.onSettingsTap),
          ],
        ),
      ),
    );
  }
}
