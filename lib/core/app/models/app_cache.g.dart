// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppCache _$AppCacheFromJson(Map<String, dynamic> json) => AppCache(
      settings: json['settings'] == null
          ? null
          : CacheSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppCacheToJson(AppCache instance) => <String, dynamic>{
      'settings': instance.settings,
    };

CacheSettings _$CacheSettingsFromJson(Map<String, dynamic> json) =>
    CacheSettings(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
      locale: $enumDecodeNullable(_$LocalesEnumMap, json['locale']),
    );

Map<String, dynamic> _$CacheSettingsToJson(CacheSettings instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
      'locale': _$LocalesEnumMap[instance.locale],
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$LocalesEnumMap = {
  Locales.tr: 'tr',
  Locales.en: 'en',
};
