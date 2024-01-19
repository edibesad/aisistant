import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../constants/enums/locales.dart';

part 'app_cache.g.dart';

@JsonSerializable()
final class AppCache {
  final CacheSettings? settings;

  const AppCache({this.settings});

  factory AppCache.fromJson(Map<String, dynamic> json) =>
      _$AppCacheFromJson(json);
}

@JsonSerializable()
class CacheSettings {
  ThemeMode? themeMode;
  Locales? locale;

  CacheSettings({this.themeMode, this.locale});

  factory CacheSettings.fromJson(Map<String, dynamic> json) =>
      _$CacheSettingsFromJson(json);
}
