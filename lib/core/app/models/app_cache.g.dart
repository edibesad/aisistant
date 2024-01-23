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

// ignore: unused_element
abstract class _$AppCachePerFieldToJson {
  // ignore: unused_element
  static Object? settings(CacheSettings? instance) => instance?.toJson();
}

Map<String, dynamic> _$AppCacheToJson(AppCache instance) => <String, dynamic>{
      'settings': instance.settings?.toJson(),
    };

CacheSettings _$CacheSettingsFromJson(Map<String, dynamic> json) =>
    CacheSettings(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
      locale: $enumDecodeNullable(_$LocalesEnumMap, json['locale']),
    );

// ignore: unused_element
abstract class _$CacheSettingsPerFieldToJson {
  // ignore: unused_element
  static Object? themeMode(ThemeMode? instance) => _$ThemeModeEnumMap[instance];
  // ignore: unused_element
  static Object? locale(Locales? instance) => _$LocalesEnumMap[instance];
}

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
