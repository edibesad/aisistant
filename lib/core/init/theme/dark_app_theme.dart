import 'package:flutter/material.dart';

import 'app_theme.dart';

class DarkAppTheme implements AppTheme {
  final ColorScheme _darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF52D7F0),
    onPrimary: Color(0xFF00363F),
    primaryContainer: Color(0xFF004E5A),
    onPrimaryContainer: Color(0xFFA4EEFF),
    secondary: Color(0xFFB2CBD1),
    onSecondary: Color(0xFF1C3439),
    secondaryContainer: Color(0xFF334A50),
    onSecondaryContainer: Color(0xFFCDE7EE),
    tertiary: Color(0xFF4ED8E7),
    onTertiary: Color(0xFF00363B),
    tertiaryContainer: Color(0xFF004F56),
    onTertiaryContainer: Color(0xFF8AF2FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E4),
    surface: Color(0xFF191C1D),
    onSurface: Color(0xFFE1E3E4),
    surfaceVariant: Color(0xFF3F484B),
    onSurfaceVariant: Color(0xFFBFC8CB),
    outline: Color(0xFF899295),
    onInverseSurface: Color(0xFF191C1D),
    inverseSurface: Color(0xFFE1E3E4),
    inversePrimary: Color(0xFF006877),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF52D7F0),
    outlineVariant: Color(0xFF3F484B),
    scrim: Color(0xFF000000),
  );

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.dark,
        colorScheme: _darkColorScheme,
      );
}
