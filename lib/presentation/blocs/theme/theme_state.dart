part of 'theme_bloc.dart';

enum ThemeStatus { initial, loading, success }

class ThemeState extends Equatable {
  final bool darkMode;
  final int selectedColor;
  final ThemeStatus themeStatus;
  const ThemeState({
    this.darkMode = false,
    this.selectedColor = 1,
    this.themeStatus = ThemeStatus.initial,
  });

  factory ThemeState.initialState() => const ThemeState();

  ThemeState copyWith({
    bool? darkMode,
    int? selectedColor,
    ThemeStatus? themeStatus,
  }) =>
      ThemeState(
        darkMode: darkMode ?? this.darkMode,
        selectedColor: selectedColor ?? this.selectedColor,
        themeStatus: themeStatus ?? this.themeStatus,
      );

  @override
  List<Object> get props => [darkMode, selectedColor, themeStatus];
}
