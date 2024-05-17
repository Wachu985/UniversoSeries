part of 'theme_bloc.dart';

enum ThemeStatus { initial, loading, success }

class ThemeState extends Equatable {
  final bool darkMode;
  final int selectedColor;
  final int selectedLanguaje;
  final ThemeStatus themeStatus;
  final String selectedServer;
  final int selectedServerInt;

  const ThemeState({
    this.darkMode = false,
    this.selectedColor = 1,
    this.selectedLanguaje = 0,
    this.themeStatus = ThemeStatus.initial,
    this.selectedServer = "https://visuales.uclv.cu/",
    this.selectedServerInt = 0,
  });

  factory ThemeState.initialState() => const ThemeState();

  ThemeState copyWith({
    bool? darkMode,
    int? selectedColor,
    ThemeStatus? themeStatus,
    int? selectedLanguaje,
    String? selectedServer,
    int? selectedServerInt,
  }) =>
      ThemeState(
        darkMode: darkMode ?? this.darkMode,
        selectedLanguaje: selectedLanguaje ?? this.selectedLanguaje,
        selectedColor: selectedColor ?? this.selectedColor,
        themeStatus: themeStatus ?? this.themeStatus,
        selectedServer: selectedServer ?? this.selectedServer,
        selectedServerInt: selectedServerInt ?? this.selectedServerInt,
      );

  @override
  List<Object> get props => [
        darkMode,
        selectedColor,
        themeStatus,
        selectedLanguaje,
        selectedServer,
        selectedServerInt,
      ];
}
