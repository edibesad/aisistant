import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../constants/enums/locales.dart';

part 'app_cache.g.dart';

@JsonSerializable()
final class AppCache {
  const AppCache({this.settings});

  factory AppCache.fromJson(Map<String, dynamic> json) =>
      _$AppCacheFromJson(json);
  final CacheSettings? settings;
}

@JsonSerializable()
class CacheSettings {
  CacheSettings({this.themeMode, this.locale});

  factory CacheSettings.fromJson(Map<String, dynamic> json) =>
      _$CacheSettingsFromJson(json);

  ThemeMode? themeMode;
  final Locales? locale;

  Map<String, dynamic> toJson() => _$CacheSettingsToJson(this);
}
