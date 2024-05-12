import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multi_player/src/core/shared_preferences/shared_preferences_singlenton.dart';

import '../../../../generated/l10n.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final _preferences = SharedPreferencesSinglenton();
  final List<String> _listLanguaje = ["es", "en"];
  ThemeBloc() : super(ThemeState.initialState()) {
    on<ToogleDarkMode>(_toogleDarkMode);
    on<LoadTheme>(_loadTheme);
    on<SwitchColor>(_switchColor);
    on<SwitchLanguaje>(_switchLanguaje);
  }

  FutureOr<void> _toogleDarkMode(
      ToogleDarkMode event, Emitter<ThemeState> emit) {
    _preferences.darkMode = !state.darkMode;
    emit(state.copyWith(darkMode: !state.darkMode));
  }

  FutureOr<void> _loadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    final languaje = _preferences.selectedLanguaje;
    S.load(Locale(_listLanguaje[languaje]));
    emit(
      state.copyWith(
        darkMode: _preferences.darkMode,
        selectedColor: _preferences.selectedColor,
        selectedLanguaje: languaje,
      ),
    );
  }

  FutureOr<void> _switchColor(SwitchColor event, Emitter<ThemeState> emit) {
    _preferences.selectedColor = event.color;
    emit(state.copyWith(selectedColor: event.color));
  }

  FutureOr<void> _switchLanguaje(
      SwitchLanguaje event, Emitter<ThemeState> emit) {
    S.load(Locale(_listLanguaje[event.languaje]));
    _preferences.selectedLanguaje = event.languaje;
    emit(state.copyWith(selectedLanguaje: event.languaje));
  }
}
