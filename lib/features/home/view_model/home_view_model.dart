import '../../../core/base/base_cubit.dart';
import '../../../core/init/navigation/app_navigation.dart';
import 'state/home_state.dart';

class HomeViewModel extends BaseCubit<HomeState> {
  HomeViewModel() : super(HomeState());

  void onOneShotTap() {
    appRouter.navigate(const OneShotRoute());
  }

  void onChatTap() {
    appRouter.navigate(const ChatListRoute());
  }

  void onSettingsTap() {
    appRouter.navigate(const SettingsRoute());
  }
}
