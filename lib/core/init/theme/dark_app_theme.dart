import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

class DarkAppTheme implements AppTheme {
  final ColorScheme _darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 8, 62, 183),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    primaryContainer: Color.fromARGB(255, 8, 62, 183),
    onPrimaryContainer: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 47, 165, 255),
    onSecondary: Color.fromARGB(255, 255, 255, 255),
    secondaryContainer: Color(0xFF334A50),
    onSecondaryContainer: Color(0xFFCDE7EE),
    tertiary: Color.fromARGB(255, 65, 85, 255),
    onTertiary: Color(0xFF00363B),
    tertiaryContainer: Color.fromARGB(255, 4, 35, 93),
    onTertiaryContainer: Color.fromARGB(255, 153, 214, 255),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color.fromARGB(255, 19, 36, 65),
    onBackground: Color(0xFFE1E3E4),
    surface: Color.fromARGB(255, 47, 165, 255),
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

  final InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
    filled: true,
    fillColor: Color.fromARGB(255, 8, 62, 183),
    labelStyle: TextStyle(color: Color.fromARGB(255, 47, 165, 255)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 8, 62, 183)),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 8, 62, 183)),
        borderRadius: BorderRadius.all(Radius.circular(16))),
  );
  final TextSelectionThemeData _selectionTheme = const TextSelectionThemeData(
      selectionHandleColor: Color.fromARGB(255, 47, 165, 255),
      selectionColor: Color.fromARGB(255, 47, 165, 255),
      cursorColor: Color.fromARGB(255, 47, 165, 255));
  final AppBarTheme _appBarTheme = const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 19, 36, 65),
      elevation: 0,
      surfaceTintColor: Colors.transparent);
  final DropdownMenuThemeData _dropdownMenuThemeData =
      const DropdownMenuThemeData(
          menuStyle: MenuStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 47, 165, 255))));

  @override
  ThemeData get themeData => ThemeData(
        canvasColor: const Color.fromARGB(255, 47, 165, 255),
        dropdownMenuTheme: _dropdownMenuThemeData,
        appBarTheme: _appBarTheme,
        textSelectionTheme: _selectionTheme,
        inputDecorationTheme: _inputDecorationTheme,
        brightness: Brightness.dark,
        colorScheme: _darkColorScheme,
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
      );
}
