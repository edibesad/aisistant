import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/cache_repository.dart';

class SPCacheManager extends CacheRepository {
  static SPCacheManager? _instance;

  factory SPCacheManager() {
    _instance ??= SPCacheManager._internal();
    return _instance!;
  }

  SPCacheManager._internal();

  @override
  Future<dynamic> get(String key) async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      dynamic value = prefs.get(key);
      if (value is String) return value;
      if (value is int) return value;
      if (value is bool) return value;
      if (value is double) return value;
      if (value is List<String>) return value;
    }
    return null;
  }

  @override
  Future<bool> put(String key, dynamic value) async {
    var prefs = await SharedPreferences.getInstance();
    if (value is String) return prefs.setString(key, value);
    if (value is int) return prefs.setInt(key, value);
    if (value is bool) return prefs.setBool(key, value);
    if (value is double) return prefs.setDouble(key, value);
    if (value is List<String>) return prefs.setStringList(key, value);
    return false;
  }

  @override
  Future<bool> delete(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  @override
  Future<bool> clear() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
