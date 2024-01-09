import 'package:flutter/material.dart';

enum Locales {
  tr(Locale('tr', 'TR')),

  en(Locale('en', 'US'));

  final Locale locale;

  const Locales(this.locale);
}
