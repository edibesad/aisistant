import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/enums/locales.dart';

@immutable
final class AppLocalization extends EasyLocalization {
  AppLocalization({super.key, required super.child})
      : super(
          supportedLocales: locales,
          path: translationsPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> locales =
      Locales.values.map((e) => e.locale).toList();
  static const String translationsPath = 'assets/translations';

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
