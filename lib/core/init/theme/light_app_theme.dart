import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

class LightAppTheme implements AppTheme {
  final ColorScheme _lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 255, 255, 255),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    primaryContainer: Color(0xFFA8DFFF),
    onPrimaryContainer: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 65, 85, 255),
    onSecondary: Color.fromARGB(255, 255, 255, 255),
    secondaryContainer: Color(0xFF334A50),
    onSecondaryContainer: Color(0xFFCDE7EE),
    tertiary: Color.fromARGB(255, 65, 85, 255),
    onTertiary: Color(0xFF0355C4),
    tertiaryContainer: Color.fromARGB(255, 255, 255, 255),
    onTertiaryContainer: Color(0xFF73C9FA),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color.fromARGB(255, 255, 255, 255),
    onBackground: Color(0xFFE1E3E4),
    surface: Color.fromARGB(255, 47, 165, 255),
    onSurface: Color(0xFF38B6FF),
    surfaceVariant: Color(0xFF0355C4),
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
    fillColor: Color.fromARGB(255, 255, 255, 255),
    labelStyle: TextStyle(color: Color.fromRGBO(47, 165, 255, 1)),
    enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 8, 62, 183), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 8, 62, 183)),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromARGB(255, 8, 62, 183), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(16))),
  );

  final TextSelectionThemeData _selectionTheme = const TextSelectionThemeData(
      selectionHandleColor: Color.fromARGB(255, 47, 165, 255),
      selectionColor: Color.fromARGB(255, 47, 165, 255),
      cursorColor: Color.fromARGB(255, 47, 165, 255));

  final AppBarTheme _appBarTheme = const AppBarTheme(
      iconTheme: IconThemeData(color: Color.fromARGB(255, 8, 62, 183)),
      titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 8, 62, 183),
          fontSize: 24,
          fontWeight: FontWeight.bold),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      surfaceTintColor: Colors.transparent);

  final DropdownMenuThemeData _dropdownMenuThemeData =
      const DropdownMenuThemeData(
          menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 255, 255, 255))));

  @override
  ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        colorScheme: _lightColorScheme,
        dropdownMenuTheme: _dropdownMenuThemeData,
        appBarTheme: _appBarTheme,
        textSelectionTheme: _selectionTheme,
        inputDecorationTheme: _inputDecorationTheme,
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
      );
}
