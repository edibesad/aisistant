import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  const SettingsState({this.language = "", this.themeMode = "system"});
  final String language;
  final String themeMode;

  @override
  List<Object?> get props => [language, themeMode];
  SettingsState copyWith({String? language, String? themeMode}) =>
      SettingsState(
          language: language ?? this.language,
          themeMode: themeMode ?? this.themeMode);
}
