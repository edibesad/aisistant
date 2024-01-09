import 'package:flutter/material.dart';

import 'app_theme.dart';

class LightAppTheme implements AppTheme {
  final _lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006877),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFA4EEFF),
    onPrimaryContainer: Color(0xFF001F25),
    secondary: Color(0xFF4B6268),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCDE7EE),
    onSecondaryContainer: Color(0xFF051F24),
    tertiary: Color(0xFF006972),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF8AF2FF),
    onTertiaryContainer: Color(0xFF001F23),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFBFCFD),
    onBackground: Color(0xFF191C1D),
    surface: Color(0xFFFBFCFD),
    onSurface: Color(0xFF191C1D),
    surfaceVariant: Color(0xFFDBE4E7),
    onSurfaceVariant: Color(0xFF3F484B),
    outline: Color(0xFF6F797B),
    onInverseSurface: Color(0xFFEFF1F2),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFF52D7F0),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006877),
    outlineVariant: Color(0xFFBFC8CB),
    scrim: Color(0xFF000000),
  );
  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        colorScheme: _lightColorScheme,
      );
}
