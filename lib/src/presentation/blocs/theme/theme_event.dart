part of 'theme_bloc.dart';

sealed class ThemeEvent {
  factory ThemeEvent.loadTheme() => LoadTheme();
  factory ThemeEvent.toogleDarkMode() => ToogleDarkMode();
  factory ThemeEvent.switchColor({required int color}) =>
      SwitchColor(color: color);
  factory ThemeEvent.switchLanguaje({required int languaje}) =>
      SwitchLanguaje(languaje: languaje);
  factory ThemeEvent.switchServer({required int server}) =>
      SwitchServer(server: server);
}

class LoadTheme implements ThemeEvent {}

class ToogleDarkMode implements ThemeEvent {}

class SwitchColor implements ThemeEvent {
  final int color;

  SwitchColor({required this.color});
}

class SwitchLanguaje implements ThemeEvent {
  final int languaje;

  SwitchLanguaje({required this.languaje});
}

class SwitchServer implements ThemeEvent {
  final int server;

  SwitchServer({required this.server});
}
