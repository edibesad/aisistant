import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/base/base_state.dart';
import '../../../core/extension/context_extension.dart';
import 'mixin/home_view_mixin.dart';
import 'widgets/page_container.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  final double _divider = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeContainer(
                  contentColor: context.colorScheme.onSurface,
                  backgroundColor: context.isDark
                      ? context.theme.colorScheme.secondary
                      : Colors.white,
                  icon: FontAwesomeIcons.comment,
                  fontSize: 48,
                  title: 'one_shot',
                  onTap: viewModel.onOneShotTap),
              SizedBox(height: _divider),
              HomeContainer(
                  contentColor: context.theme.colorScheme.surfaceVariant,
                  backgroundColor:
                      context.themeData.colorScheme.tertiaryContainer,
                  icon: FontAwesomeIcons.comments,
                  title: 'chat',
                  onTap: viewModel.onChatTap),
              SizedBox(height: _divider),
              HomeContainer(
                  backgroundColor:
                      context.themeData.colorScheme.tertiaryContainer,
                  contentColor: context.theme.colorScheme.onTertiaryContainer,
                  icon: FontAwesomeIcons.gear,
                  title: 'settings',
                  onTap: viewModel.onSettingsTap),
            ],
          ),
        ),
      ),
    );
  }
}
