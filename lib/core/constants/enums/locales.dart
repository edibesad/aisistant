import 'package:flutter/material.dart';

enum Locales {
  tr(Locale('tr', 'TR'), 'Türkçe'),

  en(Locale('en', 'US'), 'English');

  const Locales(this.locale, this.text);
  final Locale locale;
  final String text;
}
