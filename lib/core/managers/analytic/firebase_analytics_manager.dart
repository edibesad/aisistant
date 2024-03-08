import 'package:firebase_analytics/firebase_analytics.dart';

import '../../services/analytic_service.dart';

class FirebaseAnalyticsManager extends AnalyticService {
  factory FirebaseAnalyticsManager() {
    _instance ??= FirebaseAnalyticsManager._init();

    return _instance!;
  }

  FirebaseAnalyticsManager._init() {
    _firebaseAnalytics = FirebaseAnalytics.instance;
    _init();
  }

  Future<void> _init() async {
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

  static FirebaseAnalyticsManager? _instance;
  late FirebaseAnalytics _firebaseAnalytics;

  @override
  Future<void> logEvent(String name) async {
    await _firebaseAnalytics.logEvent(name: name);
  }

  @override
  Future<void> logAppOpen() async {
    await _firebaseAnalytics.logAppOpen();
  }

  @override
  void logScreenView(String screenName) {
    _firebaseAnalytics.logScreenView(screenName: screenName);
  }
}
