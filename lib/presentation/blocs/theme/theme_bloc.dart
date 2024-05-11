import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multi_player/core/shared_preferences/shared_preferences_singlenton.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final _preferences = SharedPreferencesSinglenton();
  ThemeBloc() : super(ThemeState.initialState()) {
    on<ToogleDarkMode>(_toogleDarkMode);
    on<LoadTheme>(_loadTheme);
    on<SwitchColor>(_switchColor);
  }

  FutureOr<void> _toogleDarkMode(
      ToogleDarkMode event, Emitter<ThemeState> emit) {
    _preferences.darkMode = !state.darkMode;
    emit(state.copyWith(darkMode: !state.darkMode));
  }

  FutureOr<void> _loadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    emit(
      state.copyWith(
          darkMode: _preferences.darkMode,
          selectedColor: _preferences.selectedColor),
    );
  }

  FutureOr<void> _switchColor(SwitchColor event, Emitter<ThemeState> emit) {
    _preferences.selectedColor = event.color;
    emit(state.copyWith(selectedColor: event.color));
  }
}
