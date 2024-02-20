import 'package:auto_route/auto_route.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: HomeContainer(title: "one_shot"),
      ),
    );
  }
}
