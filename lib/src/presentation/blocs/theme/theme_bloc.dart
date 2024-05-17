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
  final List<String> _listServers = [
    "https://visuales.uclv.cu/",
    "https://media.uo.edu.cu/"
  ];
  ThemeBloc() : super(ThemeState.initialState()) {
    on<ToogleDarkMode>(_toogleDarkMode);
    on<LoadTheme>(_loadTheme);
    on<SwitchColor>(_switchColor);
    on<SwitchLanguaje>(_switchLanguaje);
    on<SwitchServer>(_switchServer);
  }

  FutureOr<void> _toogleDarkMode(
      ToogleDarkMode event, Emitter<ThemeState> emit) {
    _preferences.darkMode = !state.darkMode;
    emit(state.copyWith(darkMode: !state.darkMode));
  }

  FutureOr<void> _loadTheme(LoadTheme event, Emitter<ThemeState> emit) {
    final languaje = _preferences.selectedLanguaje;
    final selectedServer = _preferences.selectedServer;
    S.load(Locale(_listLanguaje[languaje]));
    emit(
      state.copyWith(
        darkMode: _preferences.darkMode,
        selectedColor: _preferences.selectedColor,
        selectedLanguaje: languaje,
        selectedServer: _listServers[selectedServer],
        selectedServerInt: selectedServer,
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

  FutureOr<void> _switchServer(SwitchServer event, Emitter<ThemeState> emit) {
    _preferences.selectedServer = event.server;
    emit(state.copyWith(
      selectedServer: _listServers[event.server],
      selectedServerInt: event.server,
    ));
  }
}
