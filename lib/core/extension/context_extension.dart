import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  ThemeData get themeData => theme;
  bool get isDark => theme.brightness == Brightness.dark;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension MarginExtension on BuildContext {
  EdgeInsets get marginLow => EdgeInsets.all(lowValue);
  EdgeInsets get marginNormal => EdgeInsets.all(normalValue);
  EdgeInsets get marginMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get marginHigh => EdgeInsets.all(highValue);
}

extension WidgetExtension on BuildContext {
  Widget get emptyWidget => const SizedBox.shrink();
}

extension ColorExtension on BuildContext {
  Color get primaryColor => colorScheme.primary;
  Color get primaryConteinerColor => colorScheme.primaryContainer;
  Color get secondaryColor => colorScheme.secondary;
  Color get secondaryContainerColor => colorScheme.secondaryContainer;
  Color get surfaceColor => colorScheme.surface;
  Color get backgroundColor => colorScheme.background;
  Color get errorColor => colorScheme.error;
  Color get onPrimaryColor => colorScheme.onPrimary;
  Color get onSecondaryColor => colorScheme.onSecondary;
  Color get onSurfaceColor => colorScheme.onSurface;
  Color get onBackgroundColor => colorScheme.onBackground;
  Color get onErrorColor => colorScheme.onError;
  Color get shadowColor => Colors.grey.withOpacity(0.5);
}

extension TextThemeExtension on BuildContext {
  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;
  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelSmall => textTheme.labelSmall!;
}

extension IconThemeDataExtension on BuildContext {
  IconThemeData get iconTheme => theme.iconTheme;
  IconThemeData get primaryIconTheme => theme.primaryIconTheme;
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
